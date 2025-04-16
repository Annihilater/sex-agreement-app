# 性行为同意协议系统

一个用于创建、签署和管理性行为同意协议的 Web 应用程序。该应用允许用户在线创建详细的性行为同意协议，并通过数字签名方式进行签署，同时支持导出为 PDF 格式保存。

## 功能特性

- 创建自定义性同意协议
- 多步骤表单引导用户完成协议创建
- 协议可包含详细条款、安全措施、隐私条款等
- 数字签名功能
- 导出 PDF 文档
- 本地存储所有数据，保障隐私安全
- 响应式设计，适配移动和桌面设备
- 美观直观的用户界面

## 技术栈

- Next.js - React 框架
- React - 用户界面库
- TypeScript - 类型安全
- TailwindCSS - 样式框架
- DaisyUI - UI 组件库
- jsPDF - PDF 生成
- React Hook Form - 表单处理
- localStorage - 本地数据存储

## 如何使用

1. 克隆本仓库
2. 安装依赖：`npm install`
3. 启动开发服务器：`npm run dev`
4. 在浏览器中访问：`http://localhost:3000`

## 部署

本项目可以部署到任何支持静态网站或 Node.js 服务的平台：

```bash
npm run build
# 对于 Node.js 部署 (旧方式，如果未使用静态导出)
npm run start
```

## 使用 Docker 部署

本项目已配置为通过 Docker 进行构建和部署，使用 Nginx 提供静态导出的文件。

### 构建 Docker 镜像

**1. 本地构建 (与您当前的 CPU 架构相同)**

在项目根目录下运行：

```bash
docker build -t sex-agreement-app .
```

**2. 跨平台构建 (例如，在 Apple Silicon Mac 上构建适用于 Linux/AMD64 的镜像)**

确保您的 Docker Desktop 已启用 Buildx (通常默认启用)。

```bash
# 构建适用于 linux/amd64 架构的镜像
docker buildx build --platform linux/amd64 -t sex-agreement-app:amd64 --load .

# 构建适用于 linux/arm64 架构的镜像 (如果需要)
# docker buildx build --platform linux/arm64 -t sex-agreement-app:arm64 --load .
```

* `--platform`: 指定目标平台的架构。
- `-t`: 为镜像打上标签 (例如 `sex-agreement-app:amd64`)。
- `--load`: 将构建好的镜像加载到本地 Docker 镜像库中 (如果省略，则只构建不加载)。

### 运行 Docker 容器

使用 `deploy` 目录下的 `docker-compose.yml` 文件可以方便地启动服务：

```bash
# 进入 deploy 目录
cd deploy

# 启动服务 (后台运行)
docker-compose up -d

# 如果需要重新构建镜像并启动
# docker-compose up --build -d
```

服务将在主机的 80 端口上运行。您可以通过浏览器访问 `http://localhost` (或服务器 IP 地址) 来查看应用。

**停止服务:**

```bash
# 在 deploy 目录下
docker-compose down
```

## 本地存储

所有协议数据存储在浏览器的 localStorage 中，确保数据不会离开用户设备，保障用户隐私。

## 注意事项

- 此系统生成的协议仅作为参考，在某些司法管辖区可能不具备法律效力
- 用户应理解真实的同意是持续的、可以撤回的过程
- 在紧急或敏感情况下，请咨询专业法律建议
