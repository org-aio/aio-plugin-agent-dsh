# DeepSeek Harness / AIO 插件

在 AIO 工作空间里通过已配对设备运行本机 DeepSeek Harness（`dsh`）网页控制器。

- 设备侧：`aio device dsh-enable [--port 3080] [--root 项目目录]` 开启；dsh 只在设备 `127.0.0.1` 监听，凭据不出设备。
- 插件侧：声明设备视图能力，用 `aioPlugin.deviceView` 打开设备上的 dsh 页面。
- 宿主：登录、租户、用户、设备授权与视图有效期校验仍由 AIO 承担；不新增公网端口。

设备实现与验收范围见 `aio-plugin-device` 的 `src/dsh/README.md`。
