Tenant Id: 7a2ec892-a4a3-4b1c-bf32-fd77fa210f6b

createproj token: lx7meq62gpluri2bgri63okt63g6jtqu7p7lkvgofqrr72f2gadq


# Process Steps

terraform init
terraform validate
terraform fmt
terraform plan
terraform apply  -auto-approve


# Destroy Resources
terraform destroy -auto-approve

# Delete Files
rm  .terraform*
rm  terraform.tfstate*


# Enviroment
terraform plan -var-file="dev.tfvars"