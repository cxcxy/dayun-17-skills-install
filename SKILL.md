---
name: dayun-17-skills-install
description: >-
  一键安装大昀视频中的 17 项编程 Agent Skills（需求澄清、调研、设计、前端、数据库、审查、测试、排错、交付验证）。
  用户说「安装大昀 17 项」「一键安装开发技能」「装那十七项技能」「帮我安装那 17 个 skill」、
  dayun-17-skills、或明确要求批量安装这份清单时使用。执行 scripts/install.sh，不要临场重写安装命令。
---

# 大昀 17 项开发技能 · 一键安装

用户只需说一句安装口令。你负责跑脚本、读结果：用中文先写简短的安装结果，再在同一条回复里附上用法说明。

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

3. 读脚本 stdout/stderr。按下方模板先给简短安装结果，再在**同一条用户可见回复**里给出用法。不要假装成功。
4. 用法以 [USAGE.md](USAGE.md) 为准，安装来源以 [catalog.md](catalog.md) 为准。成功或只成功一部分时，必须当场把用法交给用户，不要写「需要细节时再读 catalog / USAGE」，也不要只给链接让用户自己打开文件。

## 口令示例（用户侧）

- 帮我安装大昀那 17 项开发技能
- 一键安装那十七项
- 装 dayun 17 skills

## 回报模板

先写这段简短结果，下一段立刻接上用法正文（标题、速查表、以及每项的适用场景 / 解决什么问题 / 怎么使用）：

```markdown
大昀 17 项安装结果：

- 已安装：…（技能名列表）
- 已跳过：security-review（Claude Code 内置，聊天框输入 `/security-review`）
- 特殊项：surgeon-reviewer → 已写入 `~/.claude/agents/surgeon-reviewer.md`（若失败则说明原因）
- 失败：…（命令与原因；给一条可重试建议）

新开一个 Agent 对话后再用这些技能最稳妥。

---

（此处接上 USAGE.md 的正文，不要改成「详见某文件」。）
```

脚本在成功或部分成功时，会把用法夹在 `========== DAYUN USAGE BEGIN ==========` 和 `========== DAYUN USAGE END ==========` 之间打到 stdout。把这一段原文放进回复。若这段被截断、缺失，或用户只让你转述而输出里又确认有成功项，立刻读取本 Skill 目录的 `USAGE.md`，把正文放进同一条回复。

有失败项时：结果里写明失败的命令和原因；用法至少覆盖已经成功的技能，并标明失败的技能还不能当已装好来用。全部失败、或 `DAYUN_SKILLS_DRY_RUN=1` 只打印命令时，不要把用法说成已经安装好。

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
