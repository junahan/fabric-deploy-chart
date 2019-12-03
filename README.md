# fabric 网络自动化部署的chart

使用前需要先启动ca:
```
kubeclt apply -f test/ca-deploy.yaml
```

安装
```
helm install fabric-deploy-flow -n example
```
