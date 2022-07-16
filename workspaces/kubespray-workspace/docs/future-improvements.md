# Features that can be added

- Pre-install Kubectl plugins:
    - [access-matrix](https://github.com/corneliusweig/rakkess) - show an RBAC access matrix for server resources.
    - [graph](https://github.com/steveteuber/kubectl-graph) - visualize Kubernetes resources and relationships.
    - [iexec](https://github.com/gabeduke/kubectl-iexec) - interactive selection tool for `kubectl exec`.
    - [janitor](https://github.com/dastergon/kubectl-janitor) - find objects in a problematic state in your Kubernetes cluster.
    - [ktop](https://github.com/vladimirvivien/ktop) - display workload metrics.
    - [kurt](https://github.com/soraro/kurt) - find what's restarting and why.
    - [kpexec](https://github.com/ssup2/kpexec) - run commands in a container with high privileges.
    - [mtail](https://gitlab.com/grzesuav/kubectl-mtail) - tail logs from multiple pods matching label selector.
    - [modify-secret](https://github.com/rajatjindal/kubectl-modify-secret) - modify secret with implicit base64 translations.
    - [node-restart](https://github.com/mnrgreg/kubectl-node-restart) - restart cluster nodes sequentially and gracefully.
    - [operator](https://github.com/operator-framework/kubectl-operator) - manage operators with Operator Lifecycle Manager.
    - [pod-lens](https://pod-lens.guoxudong.io/) - view pod-related resources with an interactive cli tool.
    - [pv-migrate](https://github.com/utkuozdemir/pv-migrate) - migrate data across persistent volumes.
    - [resource-capacity](https://github.com/robscott/kube-capacity) - overview resource requests, limits, and utilization.
    - [sshd](https://github.com/ottoyiu/kubectl-sshd) - run a temporary SSH server on any Running Pod in your Kubernetes cluster.
    - [sql](https://github.com/yaacov/kubectl-sql) - query the cluster via pseudo-SQL.
    - [stern](https://github.com/stern/stern) - logs from multiple pods on Kubernetes and multiple containers within the pod. Each result is color coded for quicker debugging.
    - [tree](https://github.com/ahmetb/kubectl-tree) - show a tree of object hierarchies through ownerReferences.
    - [view-secret](https://github.com/elsesiy/kubectl-view-secret) - easy secret decoding. Useful if you want to see what's inside of a secret. 

```
kubectl krew install access-matrix \
    && kubectl krew install df-pv \
    && kubectl krew install graph \
    && kubectl krew install iexec \
    && kubectl krew install janitor \
    && kubectl krew install ktop \
    && kubectl krew install mtail \
    && kubectl krew install modify-secret \
    && kubectl krew install nsenter \
    && kubectl krew install node-restart \
    && kubectl krew install operator \
    && kubectl krew install pexec \
    && kubectl krew install pod-lens \
    && kubectl krew install popeye \
    && kubectl krew install pv-migrate \
    && kubectl krew install resource-capacity \
    && kubectl krew install sshd \
    && kubectl krew install sql \
    && kubectl krew install stern \
    && kubectl krew install tree \
    && kubectl krew install view-secret 
```