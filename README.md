# fabric 网络自动化部署的chart

## 说明
|标签|用途|
|-|-|
|.dependencies.kubeConfig.localHost|kubectl config在本地的目录（测试用）|
|.dependencies.kubeConfig.localHost|kubectl config存入secret的key|
|.dependencies.tools.image|job执行时依赖的镜像|
|.dependencies.docker.sock|宿主机的docker套接字，链码实例化用到|
|.consortium.name|联盟名称  |
|.consortium.ordererType|排序共识类型(只支持solo，etcdraft) |
|.consortium.repo|镜像仓库 |
|.consortium.tag|| 
|.consortium.affiliation|关联后缀，固定为svc.cluster.local，暂时不做特别用途|
|.consortium.useAdvance|是否开启高级设置|
|.consortium.peerOrgs.name|peer组织名称|
|.consortium.peerOrgs.id|peer组织ID|
|.consortium.peerOrgs.nodes|节点|
|.consortium.peerOrgs.loglevel|节点日志|
|.advanced|高级设置|
|.advanced.ccbuilder.image|链码编译时依赖的镜像，默认是latest|
|.advanced.ccruntime.image|链码运行依赖的镜像，默认是latest|
|.advanced.couchdb.enabled|是否开启couchdb|
|.advanced.persistence|数据是否开启持久化|
|.advanced.explorer|是否开启区块链浏览器|

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
