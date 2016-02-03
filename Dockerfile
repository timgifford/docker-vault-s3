FROM alpine:3.3

COPY vault /bin/vault

# Use volume to pass in vault configuration
# COPY s3.hcl /etc/vault.hcl

# S3 connects via https, so we need the ca-certificates. 
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates

EXPOSE 8200

VOLUME ["/etc/vault.hcl"]

# Start the vault server. Using these environment variables:
# AWS_S3_BUCKET
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY 

ENTRYPOINT ["vault","server"]
CMD ["-config=/etc/vault.hcl"]
