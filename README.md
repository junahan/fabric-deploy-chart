# fabric 网络自动化部署的chart

## 说明


## 准备镜像:
1. fabric 相关： fabric-peer, fabric-orderer, fabric-ccenv, fabric-baseos
2. fabric-utils: 这个需要自己去打镜像，   
怎么去打镜像，参考[utils/Dockerfile]
  

## 安装
1. 启动ca
```
kubeclt apply -f test/ca-deploy.yaml
```
2. 导入k8s的config文件：有两种方式，存入secret和指定本地路径
```
kubectl create secret generic k8sconfig --from-file=config=/root/.kube/config
```
3. 创建pv
```
kubectl apply -f test/chaincode-pv.yaml
```
4. 启动chart
```
helm install fabric-deploy-flow -f test/value.yaml -n example
```
