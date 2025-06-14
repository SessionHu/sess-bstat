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
  curl 'https://github.com/SessionHu/sess-bstat/raw/refs/heads/main/sb.sh' --output sb.sh'
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

## 许可

- 本项目使用 GNU 通用公共许可证
