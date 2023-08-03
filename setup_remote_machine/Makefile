
GOOGLE_CRED_PATH := ${HOME}/.google/credentials/lenico-intern.json
export GOOGLE_APPLICATION_CREDENTIALS := $(GOOGLE_CRED_PATH)
run:
	@echo "Running with GOOGLE_APPLICATION_CREDENTIALS set to: ${GOOGLE_APPLICATION_CREDENTIALS}"

tf_init:
	@echo "GOOGLE_APPLICATION_CREDENTIALS set to: ${GOOGLE_APPLICATION_CREDENTIALS}"
	terraform init -backend-config=gcp-dotfile-setup-sbx.backend
	terraform workspace new gcp-dotfile-setup-sbx

tf_plan:
	@echo "GOOGLE_APPLICATION_CREDENTIALS set to: ${GOOGLE_APPLICATION_CREDENTIALS}"
	terraform plan -out=tf.plan -var-file=gcp-dotfile-setup-sbx.tfvars

tf_apply:
	@echo "GOOGLE_APPLICATION_CREDENTIALS set to: ${GOOGLE_APPLICATION_CREDENTIALS}"
	terraform apply tf.plan

tf_destroy:
	@echo "GOOGLE_APPLICATION_CREDENTIALS set to: ${GOOGLE_APPLICATION_CREDENTIALS}"
	@terraform destroy -var-file=gcp-dotfile-setup-sbx.tfvars
