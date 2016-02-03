#Setup

##Tell Vault about the server
```
export VAULT_ADDR=http://$(docker-machine ip default):8200
```

##Initialize the vault

This setting creates 3 keys. The threshold is the number of keys needed to unseal the vault.

```
vault init -key-shares=3 -key-threshold=2
```    

##Un-seal the vault
```
vault unseal
```

#Authenticate
Todo

#Transit

## Mount the transit feature
```
$ vault mount transit
```

## See some help about transit
```
$ vault path-help transit
```
## Create a new key
```
vault write -f transit/keys/timgifford
```

## Encrypt some data with the key
Values need to be base64 encoded
```
$ echo -n "this is my password" | base64 | vault write transit/encrypt/timgifford plaintext=-
Key       	Value
ciphertext	vault:v1:2KqBEaeuDxKSjsioydtarb20WWRmU778BGKM/px1BHAIGRKRrCQ8l28WueQeIFs=

$ echo -n "this is my password" | base64 | vault write transit/encrypt/timgifford plaintext=-
Key       	Value
ciphertext	vault:v1:tLQNW9nQJ49mm3KYllNoq91UHnzQsY/BMgezsKjNQPNsmPENzTIpZcVYUAjNuno=

$ echo -n "this is my password" | base64 | vault write transit/encrypt/timgifford plaintext=-
Key       	Value
ciphertext	vault:v1:RgQHAsga/Fv5zjuW5zXIQLSQsLXTKB8/PjHw6/50qPlH5M9ZGu0OGLYauZJbCVk=
```

#Datakey

Get a local key to encrypt/decrypt large files locally. You can encrypt using the plaintext and store the ciphertext with the data.
```
$ vault write transit/datakey/plaintext/timgifford plaintext=
Key       	Value
ciphertext	vault:v1:1Zv2jNife1CmmTUbt1B6P71df1wbwwX0tlJazQgsVQuMs9hWmBN7gMHy5bw3fozTG4CIiOdwNuVm38zF
plaintext 	BzudlVJ96/aU6g2BRqTGOS5mNYK7WmUHfnVY0tqGxJg=
```

When the data needs to be decrypted, decrypt the ciphertext from vault to get the plaintext key. Use this key to encrypt/decrypt data locally.
```
$ vault write transit/decrypt/timgifford ciphertext=vault:v1:1Zv2jNife1CmmTUbt1B6P71df1wbwwX0tlJazQgsVQuMs9hWmBN7gMHy5bw3fozTG4CIiOdwNuVm38zF

Key      	Value
plaintext	BzudlVJ96/aU6g2BRqTGOS5mNYK7WmUHfnVY0tqGxJg=
```

#Write Data

##Write from command line
```
$ vault write secret/a value="aaaaa"
```

##Write a file
```
$ cat data.json
{ "value": "itsasecret" }

$ vault write secret/password @data.json
```

#Read Data
```
$ vault read -field value secret/a
aaaaa
```

#Seal the vault
Todo

