#!/bin/bash

# SESS BSTAT
# Copyright (C) 2025 SessionHu
# GPLv3 licensed

COOKIE=$SESS_BSTAT_COOKIE
UA='Mozilla/5.0 (X11; Linux x86_64)'

# -A "$UA" -b "$COOKIE"

NAV=$(curl -G 'https://api.bilibili.com/x/web-interface/nav' \
  -A "$UA" -b "$COOKIE" \
  -s | jq .data)

MID=$(echo $NAV | jq .mid -r)

# =========== 基本 ============

echo -e '\e[H\e[2K==== SESS BSTAT ==='
echo -e '\e[2K---- 基本 ---------'

printf '\e[2K用户: '
echo $NAV | jq .uname -r

printf '\e[2K硬币: '
echo $NAV | jq .money

print_level() {
  level=$(echo $NAV | jq .level_info.current_level)
  cur_exp=$(echo $NAV | jq .level_info.current_exp)
  nxt_exp=$(echo $NAV | jq .level_info.next_exp -r)
  echo -e "\e[2K等级: $level ($cur_exp/$nxt_exp)"
}
print_level

print_fans() {
  printf '\e[2K粉丝: '
  curl -G 'https://api.bilibili.com/x/relation/stat' \
    --url-query "vmid=$MID" \
    -A "$UA" -b "$COOKIE" \
    -s | jq .data.follower
}
print_fans

# =========== UP 主 ============

echo -e '\e[2K---- UP 主 --------'

LAST_VIDEO=$(curl -G 'https://member.bilibili.com/x2/creative/web/archives/sp?pn=1&ps=1' \
  -A "$UA" -b "$COOKIE" \
  -s | jq .data.arc_audits.[0])

printf '\e[2K标题: '
echo $LAST_VIDEO | jq -r .Archive.title

printf '\e[2K播放: '
echo $LAST_VIDEO | jq .stat.view

printf '\e[2K点赞: '
echo $LAST_VIDEO | jq .stat.like

printf '\e[2K硬币: '
echo $LAST_VIDEO | jq .stat.coin

printf '\e[2K收藏: '
echo $LAST_VIDEO | jq .stat.favorite

printf '\e[2K弹幕: '
echo $LAST_VIDEO | jq .stat.danmaku

printf '\e[2K评论: '
echo $LAST_VIDEO | jq .stat.reply

# =========== 未读 ============

echo -e '\e[2K---- 未读 ---------'

UNREAD=$(curl -G 'https://api.vc.bilibili.com/x/im/web/msgfeed/unread' \
  -A "$UA" -b "$COOKIE" \
  -s | jq .data)

printf '\e[2K@ 我: '
echo $UNREAD | jq .at

printf '\e[2K点赞: '
echo $UNREAD | jq .like

printf '\e[2K回复: '
echo $UNREAD | jq .reply

printf '\e[2K系统: '
echo $UNREAD | jq .sys_msg

printf '\e[2K助手: '
echo $UNREAD | jq .up
