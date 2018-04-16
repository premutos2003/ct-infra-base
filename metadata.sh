                #!/bin/bash

#terraform output -json  | curl -H 'Content-Type: application/json' -d @- docker.for.mac.localhost:3000/infra
terraform output -json  | curl -H 'Content-Type: application/json' -d @- localhost:3000/infra

var=$(terraform output -json | jq -r '.s3_bucket.value')
aws s3 cp ./terraform.tfstate s3://$var/state/terraform.tfstate  --region ${REGION}
aws s3 cp  ./terraform.tfstate.backup s3://$var/state/terraform.tfstate.backup --region ${REGION}



