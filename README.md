# hdy-web

炸天帮狐蒂云分舵 - Docker 一键部署版

> Maintained by **[Outsider](https://github.com/outsider55)** 🚀

## 快速部署

```bash
git clone https://github.com/outsider55/hdy-web.git
cd hdy-web
docker compose up -d
```

访问：`http://你的服务器IP:8088`

## 功能特性

- 🐳 Docker 一键部署，开箱即用
- ⚡ 基于 Caddy 2 Alpine，轻量高性能
- 🔧 SPA 路由自动回退
- 📦 Gzip 压缩 + 静态资源长期缓存
- 🎯 默认 8088 端口，不占用 80/443

## 文件结构

```
hdy-web/
├── Dockerfile          # Caddy 2 Alpine 镜像
├── Caddyfile           # Web 服务器配置（监听 8088）
├── docker-compose.yml  # 一键启动
├── README.md
├── LICENSE
├── site/               # 站点静态文件
│   ├── index.html
│   ├── favicon.ico
│   └── assets/
│       ├── index-s1zCkg7g.js
│       └── index-CyWkKnyF.css
```

## 自定义端口

修改 `docker-compose.yml` 和 `Caddyfile` 中的 `8088` 为你想要的端口。

## License

MIT © [Outsider](https://github.com/outsider55)
