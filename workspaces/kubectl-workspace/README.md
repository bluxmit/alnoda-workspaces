# Kubectl Workspace

A dedicated workspace designed for Kubernetes admins and developers, equipped with a comprehensive collection of tools for managing Kubernetes clusters, 
installing applications, and implementing solutions. 

## Try locally

```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/kubectl-workspace
```

and open [localhost:8020](http://localhost:8020) in browser.  

Add kubeconfig file to `~/.kube/config`

## Features

- [**Kubectl**](https://kubernetes.io/docs/reference/kubectl/) - Kubernetes command-line tool, allows you to run commands against Kubernetes clusters.
- [**Helm**](https://helm.sh/) - Package manager for Kubernetes.
- [**Octant**](https://github.com/vmware-tanzu/octant) - Highly extensible platform for developers to better understand the complexity of Kubernetes clusters.
- [**K9s**](https://github.com/derailed/k9s) - Kubernetes CLI To Manage Your Clusters In Style.
- [**Kube-shell**](https://github.com/cloudnativelabs/kube-shell) - Integrated shell for working with the Kubernetes CLI.
- [**Krew**](https://krew.sigs.k8s.io/) - Plugin manager for kubectl command-line tool.
- [**kubectl-aliases**](https://github.com/ahmetb/kubectl-aliases) - Hundreds of convenient shell aliases for kubectl.
- [**kdash**](https://github.com/kdash-rs/kdash) - A simple and fast dashboard for Kubernetes.
- [**kubectx**](https://github.com/ahmetb/kubectx/) - Faster way to switch between clusters and namespaces in kubectl. 
- [**kubetail**](https://github.com/johanhaleby/kubetail) - Tail Kubernetes logs from multiple pods at the same time.
- [**ktunnel**](https://github.com/omrikiei/ktunnel) - A cli that exposes your local resources to kubernetes.
- [**kubefwd**](https://github.com/txn2/kubefwd) - Bulk port forwarding Kubernetes services for local development. 
- [**kubie**](https://github.com/sbstp/kubie) - A more powerful alternative to kubectx and kubens.
- [**kubescout**](https://github.com/ReallyLiri/kubescout) - Faster way to switch between clusters and namespaces in kubectl.
- [**ktop**](https://github.com/vladimirvivien/ktop) - A top-like tool for your Kubernetes clusters. 
- [**kubectl-doctor**](https://github.com/emirozer/kubectl-doctor) - It will scan your currently targeted k8s cluster to see if there are anomalies or useful action points that it can report back to you. 
- [**kubectl-tree**](https://github.com/ahmetb/kubectl-tree) - kubectl plugin to browse Kubernetes object hierarchies as a tree.
- [**kubespy**](https://github.com/pulumi/kubespy) - Tools for observing Kubernetes resources in real time, powered by Pulumi.
- [**kube-dump**](https://github.com/WoozyMasta/kube-dump) - Backup a Kubernetes cluster as a yaml manifest.
- [**helmfile**](https://github.com/helmfile/helmfile) - Declarative spec for deploying helm charts in Kubernetes clusters.
- [**Trivy**](https://github.com/aquasecurity/trivy) - Find vulnerabilities, misconfigurations, secrets, SBOM in Kubernetes and more. 
- [**Kube-hunter**](https://github.com/aquasecurity/kube-hunter) - Hunt for security weaknesses in Kubernetes clusters. 
- [**Kubescape**](https://github.com/kubescape/kubescape) - Kubernetes security platform for your IDE, CI/CD pipelines, and clusters. 
- [**Velero CLI**](https://github.com/vmware-tanzu/velero) - Back up and restore your Kubernetes cluster resources and persistent volumes. 
- [**argocd-cli**](https://github.com/argoproj/argo-cd) - CLI for ArgoCD - a tool for declarative, GitOps continuous delivery for Kubernetes. 
- [*Codeserver workspace features*](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/codeserver-workspace)

## Customize 

It is very easy to extend this workspace with more applications. Need task scheduler? Or Web UI to launch maintenance scripts with a click? 
Check out [alnoda.hub](https://alnoda.org/) for hundreds more apps that you can add to the workspace. 

## Run in kubernetes 

You can deploy this worksapce directly to the cluster, it is fully browser-based.  

Add Helm repository:

```
helm repo add alnoda https://bluxmit.github.io/alnoda-charts/
```

Update your Helm chart list:

```
helm repo update
```

Create Helm values file, for example file values.yaml:

```
ingress:
  enabled: true
  className: nginx
  host: example.com
```

Install the workspace:

```
helm install my-workspace alnoda/alnoda-workspace -f values.yaml
```

## Run on a cloud server 

Alternatively, run on cloud server that is in the same network of your kubernetes cluster.  

Ssh to the server, make sure you have Docker and docker-compose installed and ports 8020 - 8040 are not blocked by the firewall.  

Clone repo with docker-compose: 

```
git clone https://github.com/bluxmit/wrk-compose.git
cd wrk-compose
```

Set environmental variable WRK_HOST - public server IP which allows access over the Internet, i.e.

```
export WRK_HOST=34.194.12
```

Set workspace image and version

```
export WRK_IMAGE='alnoda/kubectl-workspace:latest'
```

start workspace

```
cd basic-auth-https; docker-compose up -d
```

Read more about changing user/password [here](https://github.com/bluxmit/wrk-compose)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  
