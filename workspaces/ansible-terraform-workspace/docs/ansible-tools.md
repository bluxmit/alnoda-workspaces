# Ansible tools


### [Ansible-cmdb](https://github.com/fboender/ansible-cmdb)

Ansible-cmdb takes the output of Ansible's fact gathering and converts 
it into a static HTML overview page (and other things) containing system configuration information.

```
ansible -m setup --tree out/ all
ansible-cmdb out/ > overview.html
```

### [Ansible inventory grapher](https://github.com/willthames/ansible-inventory-grapher)

```
ansible-inventory-grapher all | dot -Tpng > /home/static-server/my.png
```

### [Ansible Playbook Grapher](https://github.com/haidaraM/ansible-playbook-grapher)

```
ansible-playbook-grapher --include-role-tasks example.yml -o /home/static-server/example
```

### [Ansible Lint](https://ansible-lint.readthedocs.io/en/latest/installing.html)

```
ansible-lint --nocolor > /home/static-server/ansible-lint.txt
```

### [Ansible Doctor](https://ansible-doctor.geekdocs.de/)

ansible-doctor is a simple annotation like documentation generator based on Jinja2 templates. 
hile ansible-doctor comes with a default template called readme, it is also possible to write your own templates.  

The first step is to identify if the given folder is an Ansible role. This check is very simple, 
if the folder contains a sub-directory called tasks is MUST be an Ansible role! :)   

After the successful check, ansible-doctor will try to read some static files into a dictionary:
- defaults/main.yml
- meta/main.yml

```
ansible-doctor -o /home/static-server/ roles/example_production
```




### [**Ansible-pre-commit**](https://github.com/adarnimrod/ansible-pre-commit)

### Ansible Mitogen

Read [how to configure your Ansible project to work 7x faster!](https://mitogen.networkgenomics.com/ansible_detailed.html#installation)

