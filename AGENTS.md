# DeepSeek Harness 插件

- 本插件把已配对设备上运行的 DeepSeek Harness（`dsh web`，本机回环 3080）通过 AIO 设备视图通道呈现给网页；不重建 dsh 前端，也不暴露设备端口。
- 设备侧实现在 `aio-plugin-device` 的 `src/dsh`：中继本机 HTTP 与流、注入 dsh 凭据、引导文档与浏览器载体。
- 只声明 `worker_capabilities=["codex.web"]`；网页访问控制由 AIO 宿主负责（登录、租户、用户、设备授权、视图有效期）。
- 不写入任何 dsh 启动 token 或签名 cookie；凭据只留在设备内存。
- 注释使用中文；不提交本机路径、密钥或账号。
