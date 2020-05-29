# docker-events-script
根据docker events事件执行指定脚本

hub.docker.com
https://hub.docker.com/r/adockero/events-script


[![events-script](http://dockeri.co/image/adockero/events-script)](https://hub.docker.com/r/adockero/events-script)

# 使用

## 启动容器
```bash
// 简单使用，自带根据network事件执行nginx名称的容器重启配置
docker run --restart=always -d --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name events-script \
  adockero/events-script 
```


## 测试
```bash
docker run -i --rm --network host nginx ls
```

## 查看执行日志
```bash
docker logs -f adockero/events-script
```


# ini配置文件
> docker-scripts/events-script.ini文件

如下默认nginx重读配置的配置  
```ini
[nginxReload]
args='-f "type=network" -f "event=connect"'
command='sleep 2 && docker exec -i nginx nginx -t && docker exec -i nginx nginx -s reload'
```

## 自定义事件脚本
1、***[test]***头必须英文无空格  
2、只有两个配置参数。执行配置脚本是***docker-scripts/fifo_event.sh***  
3、***args***是docker events的命令参数  
4、***command***是事件触发时只需的脚本，可以使用docker命令，多个命令用&&  
5、如果是一个容器重新创建，就需要sleep等待容器能联通后在重启nginx  
