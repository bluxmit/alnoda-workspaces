# Terraform tools


### Pre-commit hook


### [Blast-Radius](https://github.com/28mm/blast-radius)
Serves folder `/home/terraform`  

In order to serve another terraform folder, for example `/home/project/my-terraform` 
```
blast-radius --serve --port 8030 /home/project/my-terraform
```

### [Terraform Visual](https://github.com/hieven/terraform-visual)

- Generate Terraform plan in json
```
terraform plan -out=plan.out                # Run plan and output as a file
terraform show -json plan.out > plan.json   # Read plan file and output it in JSON format
```
- Generate Terraform-visual report
```
terraform-visual --plan plan.json
```

### [Terraform Graph](https://www.terraform.io/docs/cli/commands/graph.html)

- Create report
```
terraform graph | dot -Tsvg > graph.svg
```


### [Inframap](https://github.com/cycloidio/inframap)

- Visualize terraform state
```
inframap generate terraform.tfstate | dot -Tpng > graph.png
```


### [Rover](https://github.com/im2nguyen/rover)

- serve terraform visualisation 
```
rover --workingDir /home/terraform
```
NOTE: Rover serves only on port 9000  

UPDATE: made fork and configured to serve on any port   

ISSUES: does not work, no resources displayed

In order to add Rover to the Workspace:

- Include in Dockerfile
```
cd /tmp && curl -Lo ./terraform-rover.zip https://github.com/bluxmit/rover/releases/download/v1.6-cust/w1.7.zip \
&& unzip /tmp/terraform-rover.zip -d /tmp/rover && rm terraform-rover.zip  \
&& chmod +x /tmp/rover/rover \
&& mv /tmp/rover/rover /usr/bin/rover \
&& rm -rf /tmp/rover \
```

- Include in supervisord-infra.conf
```
[program:rover]
directory=/home/terraform
command=/bin/sh -c " rover --workingDir /home/terraform --port 8031 "
```


## Tutorials

- [Deploy Cloud Instances with Packer and Terraform](https://www.scaleway.com/en/docs/deploy-cloud-servers-with-packer-and-terraform/)