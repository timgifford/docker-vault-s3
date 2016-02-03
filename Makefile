default: setup build run-inmem

setup:
	curl -O https://releases.hashicorp.com/vault/0.4.1/vault_0.4.1_linux_amd64.zip
	rm -f vault
	unzip vault_0.4.1_linux_amd64.zip
	rm vault_0.4.1_linux_amd64.zip	

build: 
	docker build -t timgifford/vault .

run-inmem:
	docker run -d --name vault-mem --cap-add=IPC_LOCK -v $(shell pwd)/inmem.hcl:/etc/vault.hcl -p 8300:8200  timgifford/vault

run-s3:
	docker run -d --rm --name vault-s3  --cap-add=IPC_LOCK -v $(shell pwd)/s3.hcl:/etc/vault.hcl -p 8200:8200 --env-file ./env.list timgifford/vault

clean-docker:
	docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
