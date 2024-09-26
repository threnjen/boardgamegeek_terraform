GLOBAL_PYTHON = $(DEFAULT_PYTHON)

create_env:
	pip install pipenv;
	pipenv shell;

create_backend_config:
	echo "region=\"$(TF_VAR_REGION)\"" > backend.conf;
	echo "bucket=\"$(TF_VAR_BUCKET)\"" >> backend.conf;

install_state_file_bucket:
	cd modules/s3_state_bucket && \
	terraform init && \
	terraform apply

setup_vpc:
	cd modules/vpc && \
	terraform init -backend-config ../../backend.conf && \
	terraform apply

setup_project_resource:
	terraform init -backend-config backend.conf && \
	terraform apply
