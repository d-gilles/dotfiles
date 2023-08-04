
GOOGLE_CRED_PATH := ${HOME}/.google/credentials/lenico-intern.json
export GOOGLE_APPLICATION_CREDENTIALS := $(GOOGLE_CRED_PATH)

tf_init:
	terraform init -backend-config=gcp-dotfile-setup-sbx.backend
	terraform workspace new gcp-dotfile-setup-sbx

tf_plan:
	terraform plan -out=tf.plan -var-file=gcp-dotfile-setup-sbx.tfvars

tf_apply:
	terraform apply tf.plan

tf_destroy:
	terraform destroy -var-file=gcp-dotfile-setup-sbx.tfvars

cleanup:
	rm -rf .terraform .terraform.lock.hcl tf.plan
	gsutil rm gs://dotfile-setup-sbx-tf-state/terraform/state/default.tfstate
	gsutil rm gs://dotfile-setup-sbx-tf-state/terraform/state/gcp-dotfile-setup-sbx.tfstate

add_ssh:
	gcloud compute instances add-metadata $(VM_name) --metadata-from-file ssh-keys=/home/david/.ssh/id_rsa.pub
