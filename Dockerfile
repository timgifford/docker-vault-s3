FROM alpine:3.3

COPY vault /usr/sbin/vault
COPY s3.hcl /usr/sbin/

# S3 connects via https, so we need the ca-certificates. 
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates

EXPOSE 8200

# Start the vault server. Using these environment variables:
# AWS_S3_BUCKET
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY 

ENTRYPOINT ["vault","server","-config=/usr/sbin/s3.hcl"]
