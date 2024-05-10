## 天翼校园客户端linux版docker镜像
[电信官方客户端下载](http://zsteduapp.10000.gd.cn/More/linuxDownLoad/linuxDownLoad.html)
### 使用方法：
```bash
docker run -itd -e ESURFING_USER=账号 -e ESURFING_PASSWORD=密码 --name esurfing --net=host --cpus=0.05 --memory 128m --restart=always g4yd0n/esurfing:latest
```
### 构建镜像：
```
docker buildx build -t esurfing -f .\ESurfing.Dockerfile .
```