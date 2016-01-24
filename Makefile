default: setup build run

setup:
	curl -O https://releases.hashicorp.com/vault/0.4.1/vault_0.4.1_linux_amd64.zip
	rm -f vault
	unzip vault_0.4.1_linux_amd64.zip
	rm vault_0.4.1_linux_amd64.zip	

build: 
	docker build -t timgifford/vault .

run:
	docker run -it -p 8200:8200 --env-file ./env.list timgifford/vault
