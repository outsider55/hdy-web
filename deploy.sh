#!/usr/bin/env bash
set -euo pipefail

echo "========================================="
echo "  hdy-web 一键部署脚本 by Outsider"
echo "========================================="

# 检测是否有 docker
if ! command -v docker &>/dev/null; then
  echo "[1/3] Docker 未安装，正在自动安装..."
  curl -fsSL https://get.docker.com | sh
  systemctl enable docker
  systemctl start docker
  echo "[1/3] Docker 安装完成 ✅"
else
  echo "[1/3] Docker 已存在 ✅ ($(docker --version))"
fi

# 检测是否有 docker compose
if ! docker compose version &>/dev/null; then
  echo "[2/3] Docker Compose 插件未安装，正在安装..."
  apt-get update -qq && apt-get install -y -qq docker-compose-plugin 2>/dev/null || {
    # fallback: 手动装 compose plugin
    COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
    mkdir -p /usr/local/lib/docker/cli-plugins
    curl -SL "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-linux-$(uname -m)" \
      -o /usr/local/lib/docker/cli-plugins/docker-compose
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
  }
  echo "[2/3] Docker Compose 安装完成 ✅"
else
  echo "[2/3] Docker Compose 已存在 ✅ ($(docker compose version))"
fi

# 启动服务
echo "[3/3] 正在构建并启动 hdy-web..."
docker compose up -d --build

echo ""
echo "========================================="
echo "  部署完成！"
echo "  访问地址: http://$(curl -s --max-time 5 ifconfig.me 2>/dev/null || hostname -I | awk '{print $1}'):8088"
echo "========================================="
