# Setup a VM on GCP with Terraform

## **Step 1: Set up your G Cloud Configuration**

### Define parameters

First, we need to define some parameters. In this example, I use the following values:

- Project ID: `lenico-intern`
- Region: `Europe-west1`
- Zone: `Europe-west1-b`

### Command 1:

To set up your G Cloud Configuration to use the project "lenico-intern", run the following command in your terminal:

```bash
gcloud config set project lenico-intern
```
After running this command, you'll be set to the "lenico-intern" project.

### Command 2:
To ensure Terraform has the necessary credentials to make API calls, execute:
```
gcloud auth application-default login
```

## Step 2: Create a Service Account for Your Project
We'll now create a service account.

Action Needed: Please provide a short name related to your project and let me know which environment you are setting this up for (e.g., **dev**, **prod**, **staging**, etc.).

The service account name will be in the format: `sa-{short_project_name}-tf-{Environment}`.

For example, if your short name is **demo** and you're setting up for a **sandbox** environment, the name would be `sa-demo-tf-sbx`.

Provide the short name and the environment, and I'll generate the command for you.

```
name: dotfile-setup
env: sbx
```

## Command 3:
To create the service account for the dotfile-setup project in the sbx environment, run the following command:

```
gcloud iam service-accounts create sa-dotfile-setup-tf-sbx \
--description="Terraform Service account for Dotfile Setup Sandbox Environment" \
--display-name="Terraform Service Account"
```
**OUTPUT>:**

```Created service account [sa-dotfile-setup-tf-sbx].```

## Step 3: Provide Your Service Account with Necessary Roles and Permissions
### Command 4:
Now, let's grant the necessary roles to the service account. For simplicity, we're giving it the editor role, which has broad permissions. In a real-world scenario, you'd ideally narrow down the permissions based on exact needs.


```gcloud projects add-iam-policy-binding lenico-intern \
--member="serviceAccount:sa-dotfile-setup-tf-sbx@lenico-intern.iam.gserviceaccount.com" \
--role="roles/editor"
```

**OUTPUT>:**

```
Updated IAM policy for project [lenico-intern].
bindings:
- members:
  - serviceAccount:service-388800983514@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
  ... (and so on)
```

## Command 5:
We'll also grant permissions to impersonate the service account. First, fetch the current IAM policy for the service account and save it to policy.json.

```
gcloud iam service-accounts get-iam-policy sa-dotfile-setup-tf-sbx@lenico-intern.iam.gserviceaccount.com \
--format=json > policy.json
```
**Action Needed**: You need to manually modify the policy.json file to add your user as a member with the role roles/iam.serviceAccountTokenCreator.

The modification will look something like:


```
{
  "bindings": [
    {
      "members": [
        "user:your_email@domain.com"
      ],
      "role": "roles/iam.serviceAccountTokenCreator"
    }
  ],
  ...
}
```
Replace your_email@domain.com with your actual Google Cloud email address.

## Command 6:
Once you've modified the policy.json file, update the service account with the new policy:

```
gcloud iam service-accounts set-iam-policy sa-dotfile-setup-tf-sbx@lenico-intern.iam.gserviceaccount.com policy.json
```
**OUTPUT>:**

```
Updated IAM policy for service account [sa-dotfile-setup-tf-sbx@lenico-intern.iam.gserviceaccount.com].
etag: BwYB8K4D9XI=
version: 1
... (and so on)
```

## Step 4: Create a Cloud Storage Bucket for Terraform State

### Command 7:

Let's create a bucket to store the Terraform state. This helps manage and version the infrastructure changes.

```bash
gsutil mb -l europe-west1 gs://dotfile-setup-sbx-tf-state
```

Here, the bucket is named **`dotfile-setup-sbx-tf-state`** and is being created in the `europe-west1` region. You can change the region if required.

### Command 8:

To enable versioning (to keep track of every change) on the bucket:

```bash
gsutil versioning set on gs://dotfile-setup-sbx-tf-state
```

After successfully creating and configuring the bucket we can move on to setting up the Terraform configuration.

## Step 5: Setting Up Terraform Configuration

Now, you'll create and configure the required Terraform files. I'll guide you through the contents of each file. You'll need to create these files in the directory you're planning to run Terraform from.

**Action Needed**: Create the following files in your preferred directory:

1. **`main.tf`**
2. **`gcp-dotfile-setup-sbx.tfvars`**
3. **`gcp-dotfile-setup-sbx.backend`**
4. **`variables.tf`**
5. **`version.tf`**

Here are the contents for each file:

### 5.1. main.tf

```
provider "google" {
  project                     = var.project_id
  region                      = var.region
  zone                        = var.zone
  impersonate_service_account = var.tf_service_account
}

# create a compute engine
resource "google_compute_instance" "default" {
  name         = "Test-Dev-1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    # Access to the public internet
    network       = "default"
    access_config {}
  }
}

```

### 5.2. gcp-dotfile-setup-sbx.tfvars

```
project_id           = "lenico-intern"
region               = "europe-west1"
zone                 = "europe-west1-b"
tf_service_account   = "sa-dotfile-setup-tf-sbx@lenico_intern.iam.gserviceaccount.com"
```

### 5.3. gcp-dotfile-setup-sbx.backend

```
bucket                      = "dotfile-setup-sbx-tf-state"
prefix                      = "terraform/state"
impersonate_service_account = "sa-dotfile-setup-tf-sbx@**lenico-intern**.iam.gserviceaccount.com"
```

### 5.4. variables.tf

```
variable "project_id" {
  description = "The project ID to deploy to"
}

variable "region" {
  description = "The region to deploy to"
}

variable "zone" {
  description = "The zone within the region"
}

variable "tf_service_account" {
  description = "Service account to impersonate for Terraform"
}
```

### 5.5. version.tf

```
terraform {
  required_version = "~> 1.5.0"
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.64.0"
    }
  }
}

```

After you have created and filled these files, we can proceed with initializing the Terraform configurations.

## **Step 6: Initialize the Terraform Code**

First make sure to have the right key set in the  `GOOGLE_APPLICATION_CREDENTIALS` environment variable.

1. Download the key file:

    ```jsx
    gcloud iam service-accounts keys create ~/.google/credentials/lenico-intern.json --iam-account sa-dotfile-setup-tf-sbx@lenico-intern.iam.gserviceaccount.com
    ```

2. **Secure the Key**:

    ```bash
    chmod 600  ~/.google/credentials/lenico-intern.json
    ```

3. **Update the Environment Variable**:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS=~/.google/credentials/lenico-intern.json
    ```


### Command 9:

Now, we'll initialise the Terraform directory with the specified backend configuration. This will set up the Terraform working directory for the given GCP project and fetch any necessary plugins.

```bash
terraform init -backend-config=gcp-dotfile-setup-sbx.backend
```

This command should download the Google provider for Terraform and initialize the backend state storage in your GCP Cloud Storage bucket.
## Step 7: Create a Workspace

Terraform workspaces allow you to maintain separate state files for different environments like dev, staging, and production, all within the same configuration.

### Command 10:

For this setup, we're creating a workspace for the **`sbx`** environment:

```bash
terraform workspace new gcp-dotfile-setup-sbx
```

After successfully initializing Terraform and creating the workspace, we can proceed to the planning phase.

## Step 8: Plan and Apply Your Infrastructure Changes

### Command 11:

Now, let's generate and show an execution plan. This will provide a preview of the changes that Terraform will make to align the real infrastructure with your configuration.

```bash
terraform plan -out=tf.plan -var-file=gcp-dotfile-setup-sbx.tfvars
```

This will save the plan to a file named **`tf.plan`**, which we can then apply in the next step. Look over the plan to ensure everything is as expected.

### Command 12:

If you're satisfied with the plan and are ready to apply the changes, execute the following:

```bash
terraform apply tf.plan
```

This command will apply the changes outlined in **`tf.plan`** to create, modify, or delete infrastructure resources to match the configuration.
