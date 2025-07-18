# SESS BSTAT

- 一个使用 Shell 编写的高通用性与兼容性 B 站信息展示牌 (B 数牌)

## 使用

- 本工具依赖 `bash` `curl` `jq`
  ```sh
  # Termux 示例
  apt install bash curl jq
  ```

- 从仓库或 Releases 处下载最新版本的 `sb.sh`
  ```sh
  curl -L 'https://github.com/SessionHu/sess-bstat/raw/main/sb.sh' --output sb.sh
  chmod +x sb.sh
  ```
- 设置环境变量 `SESS_BSTAT_COOKIE` 为你的 B 站 Cookie
  ```sh
  # 请从浏览器中获取到你的实际 SESSDATA
  export SESS_BSTAT_COOKIE='SESSDATA=xxxxxx'
  ```

- 运行 `sb.sh` 查看数据 (任选)
  ```sh
  # 只查看一次
  ./sb.sh
  # 更流畅
  watch -tc sb.sh
  # 更复古
  clear; while true; do ./sb.sh; sleep 2; done
  ```

- 了解 `watch` 等命令用法以调整显示效果

- 你可以用任何你喜欢的终端模拟器及其配置以调整显示效果

## 支持

- 欢迎在 Issues 提供关于本项目的建议与问题报告

- 欢迎前往 [QQ 交流群](https://www.bilibili.com/opus/1063318818878652433) 获取社区支持

- 本项目离不开 [bilibili-API-collect](https://github.com/SocialSisterYi/bilibili-API-collect) 社区的共同努力

## 许可

- 本项目使用 GNU 通用公共许可证
