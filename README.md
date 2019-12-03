# fabric 网络自动化部署的chart

准备镜像:
1. fabric相关
2. build utils   
依赖可以自己下载

使用前准备:
1. 讲.kube/config 文件存入secret 或者指定主机路径
```
kubectl create secret generic k8sconfig --from-file=config=/root/.kube/config
```
```
kubeclt apply -f test/ca-deploy.yaml
```

安装
```
helm install fabric-deploy-flow -n example
```
