# Create Server in Scaleway with Terraform

## Prepare workspace

Set your credentials as environment variable in your workspace. 
Add the following lines to /home/abc/.zshrc:

```
export SCW_DEFAULT_PROJECT_ID=<YOUR_PROJECT_ID>
export SCW_ACCESS_KEY=<YOUR_ACCESS_KEY>
export SCW_SECRET_KEY=<YOUR_SECRET_KEY>
```

## Terraform

- Initialize terraform project 
```
terraform init
```
- Show Terraform plan
```
terraform plan
```
- Apply to create new ifrastructure
```
terraform apply
```
- Destroy infrastructure completely
```
terraform destroy
```


