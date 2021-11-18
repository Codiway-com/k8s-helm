# k8s-helm/configmap
ConfigMap primitive for heml Kubernetes
#Usage
```console
$ helm repo add codiway-k8s https://ameijer.github.io/k8s-as-helm/
```

create values.yaml
```yaml
configmap:
  - name: some-configmap
    configmapData:
      username: admin
      password: qwerty
  - name: some-configmap-binary
    configmapBinaryData:
      data: "
<svg height=\"100\" width=\"100\">
<circle cx=\"50\" cy=\"50\" r=\"40\" stroke=\"black\" stroke-width=\"3\" fill=\"red\" />
Sorry, your browser does not support inline SVG.
</svg>"
  - name: some-yaml
    configmapYaml:
      tls:
        certificates:
          - certFile: /certificates/fullchain.pem
            keyFile: /certificates/privkey.pem
```
run:
```console
$ helm install my-release codiway-k8s/k8s-configmap -f values.yaml
```