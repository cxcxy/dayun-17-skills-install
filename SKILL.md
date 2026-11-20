---
name: dayun-17-skills-install
description: >-
  一键安装大昀视频中的 17 项编程 Agent Skills（需求澄清、调研、设计、前端、数据库、审查、测试、排错、交付验证）。
  用户说「安装大昀 17 项」「一键安装开发技能」「装那十七项技能」「帮我安装那 17 个 skill」、
  dayun-17-skills、或明确要求批量安装这份清单时使用。执行 scripts/install.sh，不要临场重写安装命令。
---

# 大昀 17 项开发技能 · 一键安装

用户只需说一句安装口令。你负责跑脚本、读结果、用中文简短回报。

## 触发后立刻做

1. 确认本机有 Node.js（`node -v`）。没有就停下，告诉用户先装 Node.js 22+。
2. 在本 Skill 目录执行安装脚本（优先用绝对路径或相对本 Skill 的路径）：

```bash
bash scripts/install.sh
```

可选环境变量：

| 变量 | 作用 | 默认 |
|---|---|---|
| `DAYUN_SKILLS_AGENTS` | 传给 `npx skills -a`，如 `cursor`、`claude-code`、`'*'` | `'*'`（本机检测到的全部 Agent） |
| `DAYUN_SKILLS_SCOPE` | `global` 或 `project` | `global` |
| `DAYUN_SKILLS_DRY_RUN` | 设为 `1` 只打印将执行的命令 | 关闭 |

3. 读脚本 stdout/stderr，按下方模板回报。不要假装成功。
4. 需要细节时再读 [catalog.md](catalog.md)。

## 口令示例（用户侧）

- 帮我安装大昀那 17 项开发技能
- 一键安装那十七项
- 装 dayun 17 skills

## 回报模板

```markdown
大昀 17 项安装结果：

- 已安装：…（技能名列表）
- 已跳过：security-review（Claude Code 内置，聊天框输入 `/security-review`）
- 特殊项：surgeon-reviewer → 已写入 `~/.claude/agents/surgeon-reviewer.md`（若失败则说明原因）
- 失败：…（命令与原因；给一条可重试建议）

新开一个 Agent 对话后再用这些技能最稳妥。
```

## 规则

1. **优先脚本。** 不要手写一长串 `npx skills add`；改脚本或设环境变量。
2. **全局默认。** 小白场景默认装到用户级（`-g`），除非用户明确说「只装当前项目」。
3. **不覆盖冲突。** 脚本已处理；若某项已存在，按脚本输出如实说「已存在 / 已更新」。
4. **不安装本安装器自身的循环依赖问题。** 本 Skill 只负责那 17 项。
5. **安全边界。** 只安装 [catalog.md](catalog.md) 列出的来源；用户若要求加装清单外技能，先确认再装。

## 观众如何第一次拿到本安装器

本机还没有本 Skill 时：

```bash
npx skills add cxcxy/dayun-17-skills-install -g -y
```

然后对 AI 说：「帮我安装大昀那 17 项开发技能」。
