# docker-events-script
根据docker events事件执行指定脚本

# 使用

## 启动容器
```bash
// 简单使用，自带根据network事件执行nginx名称的容器重启配置
docker run --restart=always -d -v /var/run/docker.sock:/var/run/docker.sock --privileged --name events-script adockero/events-script 
```


## 测试
```bash
docker run -i --rm --network host nginx ls
```
