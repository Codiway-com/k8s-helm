# k8s-helm/pvc
PVC primitive for heml Kubernetes
#Usage
```console
$ helm repo add codiway-k8s https://ameijer.github.io/k8s-as-helm/
```

create values.yaml
```yaml
pvc:
  - name: test-volume-claim
    accessModes:
      - ReadWriteOnce
    storageClassName: "local-persist"
    size: 1G
```
run:
```console
$ helm install my-release codiway-k8s/k8s-pvc -f values.yaml
```