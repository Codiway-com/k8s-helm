# k8s-helm/secret
Secret primitive for heml Kubernetes
#Usage
```console
$ helm repo add codiway-k8s https://ameijer.github.io/k8s-as-helm/
```

create values.yaml
```yaml
secrets:
  secrets:
    - name: login
      values:
        username: admin
        password: qwerty
    - name: traefic-basic-auth
      data:
        users: |2
          dGVzdDokYXByMSRINnVza2trVyRJZ1hMUDZld1RyU3VCa1RycUU4d2ovCnRlc3QyOiRhcHIxJGQ5aHI5SEJCJDRIeHdnVWlyM0hQNEVzZ2dQL1FObzAK==
```
run:
```console
$ helm install codiway-secrets codiway-k8s/k8s-secret -f values.yaml
```