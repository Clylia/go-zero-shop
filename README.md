# 简介
这是一套基于go-zero商城的微服务(前端后续也会开源出来)

# 声明  
这个项目是本人在工作之余学习go-zero时编写的，这并不是一个经过考验的项目，但是可能会适合一些刚学习go-zero的同学参考。在抄功能的同时，项目中也使用了很多go-zero的基础功能和组件，所以有问题可以尽情提交lssues,共同学习。     

# 项目结构
```
|-- go-zero-shop
    |-- apps           //微服务
        |-- api        // BFF 服务
            └── api 
        |-- user       // 用户服务
            └── rpc
            └── admin
        |-- cart      // 购物车服务
            └── rpc
            └── admin
        |-- order     // 订单服务
            └── rpc
            └── admin
        |-- product  // 商品服务服务
            └── rpc
            └── admin
```
# 安装
获取代码  
` git clone https://github.com/inccleo/go-zero-shop.git`

安装依赖  
`go mod tidy`


安装Goctl工具

`GOPROXY=https://goproxy.cn/,direct go install github.com/zeromicro/go-zero/tools/goctl@latest`

启动api  
`cd apps/api && go run api.go`



# 部署
本地推荐使用docker-compose 
#### /deploy/docker-compose/docker-compose.yml

线上部署推荐使用k8s
### 示例 
```
# 生成dockerfile
cd apps/user/rpc
goctl docker -go user.go

# 构建镜像
docker build -t user-rpc:v1 -f apps/user/rpc/Dockerfile .

# 生成k8s yaml文件
$ goctl kube deploy -name user-rpc -namespace go-zero-shop -image user-rpc:v1 -o user-rpc.yaml -port 9001

# 使用yaml文件创建k8s资源
kubectl apply -f user-rpc.yaml
```
