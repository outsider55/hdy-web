# hdy-web

炸天帮狐蒂云分舵 - Docker 一键部署版

## 快速部署

```bash
git clone https://github.com/你的用户名/hdy-web.git
cd hdy-web
docker compose up -d
```

访问：`http://你的服务器IP:8088`

## 文件结构

```
├── Dockerfile          # Caddy 2 Alpine 镜像
├── Caddyfile           # Web 服务器配置（监听 8088）
├── docker-compose.yml  # 一键启动
├── site/               # 站点静态文件
│   ├── index.html
│   ├── favicon.ico
│   └── assets/
│       ├── index-s1zCkg7g.js
│       └── index-CyWkKnyF.css
```

## 自定义端口

修改 `docker-compose.yml` 和 `Caddyfile` 中的 `8088` 为你想要的端口。
