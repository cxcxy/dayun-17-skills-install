#!/usr/bin/env bash
# 大昀 17 项开发技能一键安装
set -euo pipefail

AGENTS="${DAYUN_SKILLS_AGENTS:-*}"
SCOPE="${DAYUN_SKILLS_SCOPE:-global}"
DRY_RUN="${DAYUN_SKILLS_DRY_RUN:-0}"
SURGEON_URL="https://raw.githubusercontent.com/LucianFord/agent-pack/main/agents/surgeon-reviewer.md"
SURGEON_DEST="${HOME}/.claude/agents/surgeon-reviewer.md"

ok_list=()
fail_list=()
skip_list=()

log() { printf '%s\n' "$*"; }
hr() { log "----"; }

need_node() {
  if ! command -v node >/dev/null 2>&1; then
    log "✗ 未找到 Node.js。请先安装 Node.js 22+，再重新运行。"
    exit 1
  fi
  if ! command -v npx >/dev/null 2>&1; then
    log "✗ 未找到 npx。请确认 Node.js 安装完整。"
    exit 1
  fi
  log "✓ Node $(node -v)"
}

run_cmd() {
  local label="$1"
  shift
  if [[ "$DRY_RUN" == "1" ]]; then
    log "[dry-run] $*"
    ok_list+=("$label (dry-run)")
    return 0
  fi
  log "→ $label"
  if "$@"; then
    ok_list+=("$label")
    log "✓ $label"
  else
    fail_list+=("$label")
    log "✗ $label"
  fi
}

skills_add() {
  local repo="$1"
  shift
  local -a skills=("$@")
  local -a cmd=(npx --yes skills@latest add "$repo" -y)
  local s

  if [[ "$SCOPE" == "global" ]]; then
    cmd+=(-g)
  fi
  cmd+=(-a "$AGENTS")
  for s in "${skills[@]}"; do
    cmd+=(-s "$s")
  done

  run_cmd "$repo [${skills[*]}]" "${cmd[@]}"
}

skills_add_full_depth() {
  local repo="$1"
  shift
  local -a skills=("$@")
  local -a cmd=(npx --yes skills@latest add "$repo" -y --full-depth)
  local s

  if [[ "$SCOPE" == "global" ]]; then
    cmd+=(-g)
  fi
  cmd+=(-a "$AGENTS")
  for s in "${skills[@]}"; do
    cmd+=(-s "$s")
  done

  run_cmd "$repo [${skills[*]}] (full-depth)" "${cmd[@]}"
}

install_surgeon() {
  local label="surgeon-reviewer → ${SURGEON_DEST}"
  if [[ "$DRY_RUN" == "1" ]]; then
    log "[dry-run] curl -fsSL -o ${SURGEON_DEST} ${SURGEON_URL}"
    ok_list+=("$label (dry-run)")
    return 0
  fi
  mkdir -p "$(dirname "$SURGEON_DEST")"
  if command -v curl >/dev/null 2>&1; then
    if curl -fsSL -o "$SURGEON_DEST" "$SURGEON_URL"; then
      ok_list+=("$label")
      log "✓ $label"
    else
      fail_list+=("$label")
      log "✗ $label"
    fi
  elif command -v wget >/dev/null 2>&1; then
    if wget -q -O "$SURGEON_DEST" "$SURGEON_URL"; then
      ok_list+=("$label")
      log "✓ $label"
    else
      fail_list+=("$label")
      log "✗ $label"
    fi
  else
    fail_list+=("$label (无 curl/wget)")
    log "✗ 无 curl/wget，无法下载 surgeon-reviewer"
  fi
}

main() {
  log "大昀 17 项开发技能安装"
  log "agents=${AGENTS}  scope=${SCOPE}  dry_run=${DRY_RUN}"
  hr
  need_node
  hr

  # 01 + 03
  skills_add mattpocock/skills grill-with-docs to-spec
  # 02
  skills_add ericgandrade/claude-superskills deep-research
  # 04
  skills_add pbakaus/impeccable impeccable
  # 05
  skills_add nextlevelbuilder/ui-ux-pro-max-skill ui-ux-pro-max
  # 06 + 12
  skills_add anthropics/skills frontend-design webapp-testing
  # 07 + 08 + 16
  skills_add vercel-labs/agent-skills \
    vercel-react-best-practices \
    vercel-composition-patterns \
    web-design-guidelines
  # 09
  skills_add supabase/agent-skills supabase-postgres-best-practices
  # 11 + 13 + 15
  skills_add obra/superpowers \
    test-driven-development \
    systematic-debugging \
    verification-before-completion
  # 17
  skills_add_full_depth PageAI-Pro/ralph-loop e2e-tester
  # 10
  install_surgeon
  # 14
  skip_list+=("security-review（Claude Code 内置：聊天框输入 /security-review）")
  log "○ 跳过 security-review（内置命令，无需安装）"

  hr
  log "汇总"
  log "已处理成功 ${#ok_list[@]} 项："
  for x in "${ok_list[@]:-}"; do log "  ✓ $x"; done
  if ((${#skip_list[@]})); then
    log "已跳过 ${#skip_list[@]} 项："
    for x in "${skip_list[@]}"; do log "  ○ $x"; done
  fi
  if ((${#fail_list[@]})); then
    log "失败 ${#fail_list[@]} 项："
    for x in "${fail_list[@]}"; do log "  ✗ $x"; done
    log "可重试：DAYUN_SKILLS_AGENTS='cursor' bash scripts/install.sh"
    exit 1
  fi
  log "全部完成。建议新开一个 Agent 对话后再使用这些技能。"
}

main "$@"
