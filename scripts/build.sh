#!/bin/sh
set -eu
cd "$(dirname "$0")/.."

# 交付构建以只读根文件系统运行，zig 需要可写的全局与本地缓存目录；
# 指向 /tmp 下的私有目录，避免链接阶段因无法创建缓存路径而失败。
ZIG_GLOBAL_CACHE_DIR="${ZIG_GLOBAL_CACHE_DIR:-/tmp/zig-global-cache}"
ZIG_LOCAL_CACHE_DIR="${ZIG_LOCAL_CACHE_DIR:-/tmp/zig-local-cache}"
export ZIG_GLOBAL_CACHE_DIR ZIG_LOCAL_CACHE_DIR
mkdir -p "$ZIG_GLOBAL_CACHE_DIR" "$ZIG_LOCAL_CACHE_DIR"

cargo test --locked
cargo zigbuild --locked --release \
  --target x86_64-unknown-linux-gnu.2.17

mkdir -p dist/frontend
cp frontend/index.html frontend/styles.css frontend/app.js dist/frontend/
codex_target_dir="${CARGO_TARGET_DIR:-target}"
cp "$codex_target_dir/x86_64-unknown-linux-gnu/release/az-agent-dsh-server" dist/server
chmod 0755 dist/server
