# 大昀 17 项 · 使用说明

安装成功（或只成功一部分）时，应直接阅读这份说明。它覆盖清单里的全部 17 项：每项写明适用场景、解决什么问题、怎么对 Codex / Claude Code / Cursor 开口。

安装来源和批次仍以 [catalog.md](./catalog.md) 为准。本文件不改变要装哪些技能。

多数技能没有单独的斜杠命令。下面只有上游文档写明的命令才会写成 `/...` 或 `$...`，并注明在哪个工具里有效。没有写明的，就在**新开的一条** Agent 对话里点名技能。装完技能的那一次对话往往还没加载它们。

## 速查

| # | 技能 | 什么时候用 | 怎么开口 |
|---|---|---|---|
| 01 | `grill-with-docs` | 还没动手，需求说不清 | Claude Code：`/grill-with-docs`。其他工具：点名该技能，让它先读文档再追问 |
| 02 | `deep-research` | 选型、竞品、技术尽调，结论要有出处 | 「用 deep-research 调研……」 |
| 03 | `to-spec` | 已经谈妥，要收成可接手的规格 | Claude Code：`/to-spec`。其他工具：点名该技能，不要再访谈 |
| 04 | `impeccable` | 页面已有，要打磨或审查视觉与交互 | Claude Code / Cursor：`/impeccable …`。Codex：`$impeccable …` |
| 05 | `ui-ux-pro-max` | 新界面或换主题，要一套能复用的设计规则 | 直接说产品类型和要做的界面；或点名该技能 |
| 06 | `frontend-design` | 做页面之前先定这个产品自己的视觉方向 | 「用 frontend-design，先定视觉方向再写页面」 |
| 07 | `vercel-react-best-practices` | 写或审 React / Next.js 的性能 | 「用 vercel-react-best-practices 看请求有没有串行、首屏包是不是太大」 |
| 08 | `vercel-composition-patterns` | 组件上的开关参数越加越多 | 「用 vercel-composition-patterns 改成组合，去掉布尔开关」 |
| 09 | `supabase-postgres-best-practices` | 写 SQL、改表、索引、行级权限、慢查询 | 「写之前先用 supabase-postgres-best-practices」 |
| 10 | `surgeon-reviewer` | 审 PR 或 AI 改动，只要会出事的问题 | Claude Code：「用 surgeon-reviewer 审查这个 PR」 |
| 11 | `test-driven-development` | 写功能或修 bug，在写实现之前 | 「用 test-driven-development：先写失败测试」 |
| 12 | `webapp-testing` | 本地页面当场点一遍，看截图和日志 | 「用 webapp-testing 打开本地页面操作并截图」 |
| 13 | `systematic-debugging` | 报错、测试失败、行为不对 | 「用 systematic-debugging，查清根因再改」 |
| 14 | `security-review` | 合并前看这次分支改动的安全风险 | 仅 Claude Code：`/security-review`（不安装） |
| 15 | `verification-before-completion` | Agent 要宣布做完、修好或测试通过 | 「用 verification-before-completion，重跑检查再下结论」 |
| 16 | `web-design-guidelines` | 按网页规范审可访问性等问题，并定位到行 | 「用 web-design-guidelines 审查这些文件」 |
| 17 | `e2e-tester` | 把真实用户流程写成可重复的 Playwright 测试 | 「用 e2e-tester 为这个流程写端到端测试」 |

常见搭配（不是必须按这个顺序）：先 `grill-with-docs` 问清，需要选型再用 `deep-research`，谈妥后 `to-spec`；实现时用 `test-driven-development`；界面用 04–06 和 16；收尾用 `surgeon-reviewer`、`security-review`（仅 Claude Code）和 `verification-before-completion`。

---

## 01 `grill-with-docs`

**适用场景。** 准备改一个功能或定一个方案，但需求、边界和用词都还含糊。希望先把问题问透，并把术语和关键决定留在仓库里。

**解决什么问题。** 人和 Agent 没对齐就开写，做出来不是想要的。项目里的行话每次都要重新解释，难解释的决定也没有记录。

**怎么使用。** 这是上游标成「必须你亲手调用」的技能（`disable-model-invocation: true`），不会在你只说「做个功能」时自己启动。

- Claude Code：输入 `/grill-with-docs`。
- Codex、Cursor 或其他 Agent：不要假设也有这条斜杠命令。直接说：「使用 grill-with-docs：先读这个项目已有的文档，再一个一个追问我还没说清的地方。把术语写进 GLOSSARY.md，把难解释的决定写成 ADR。」

上游这个技能很短，内容是再去调用同仓库里的 `grilling` 和 `domain-modeling`。这两项不在本安装清单里。如果 Agent 说找不到它们，让它按上面这句话自己做访谈和文档，不要假装那两个技能已经装上。

## 02 `deep-research`

**适用场景。** 选定技术方案之前要查资料：竞品、文献、技术尽调，或任何需要交叉核对后才能下的结论。

**解决什么问题。** 只搜到一条材料就下结论，没有出处，也没有说明哪里还不确定。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 deep-research 调研：我们该用队列还是直接写数据库来做这件异步任务？请交叉核对，结论都附上来源。

技能会先请你选模式：Standard（约 12–15 个来源，你不选时默认这个）、Verbose、Exhaustive。想要最深的一轮时说「用 Exhaustive」或「要 frontier / 尽可能深」。原生模式用 Agent 自带的网页搜索，上游说明不需要另配 API key。

## 03 `to-spec`

**适用场景。** 这轮对话里方案和验收已经谈妥，要把它们收成一份别人（或下一个 Agent）接手就能做的开发规格。

**解决什么问题。** 共识散落在聊天里，接手的人会漏掉边界、验收和明确不做的事。

**怎么使用。** 同样是必须亲手调用的技能，不会在闲聊时自己启动。它不再访谈需求，只整理已经说过的内容；写规格前会先看代码库，并和你确认测试接缝是否符合预期。规格按上游模板包含问题、方案、用户故事、实现决定、测试决定、不做的范围，然后发到项目的 issue 跟踪器，并加上 `ready-for-agent` 标签。

- Claude Code：输入 `/to-spec`。
- Codex、Cursor 或其他 Agent：说「使用 to-spec。不要再访谈。把这次对话里已经定下的方案和验收整理成规格，发到项目的 issue 跟踪器。」

若它提示还没有 issue 跟踪器配置：上游技能会要求另跑 `/setup-matt-pocock-skills`。那一项不在这 17 项里，本安装器不会装它。需要的话再单独安装 `mattpocock/skills` 里的 `setup-matt-pocock-skills`，每个仓库运行一次，选择 GitHub、GitLab 或本地文件。

## 04 `impeccable`

**适用场景。** 页面或组件已经做出来了，要看实际效果，打磨排版、字体、颜色、交互和边界情况，或在交付前做一次设计和可访问性审查。

**解决什么问题。** 「好看一点」太模糊，生成界面容易挤在同一套默认样式里。审查时也不知道先改哪一条。

**怎么使用。** 上游把用法写成带目标的命令。每个项目先做一次初始化，让它写出 `PRODUCT.md`；已有视觉系统时再 `document`，写出 `DESIGN.md`。目标越窄越好，例如一块定价卡片，而不是整站一眼扫过。

- Claude Code、Cursor 等使用斜杠命令的工具：`/impeccable init`，然后例如 `/impeccable critique the pricing cards`。只输入 `/impeccable` 可以在 Agent 里看到命令列表。
- Codex：不要用斜杠形式。打开 `/skills`，或输入 `$impeccable`。初始化是 `$impeccable init`。

上游列出的命令（名称以官方 README 为准）：

| 用途 | 命令 |
|---|---|
| 调整方向 | `bolder` `quieter` `distill` `colorize` `typeset` `layout` `animate` `delight` `overdrive` |
| 审查 | `critique`（可用性评分）`audit`（可访问性、性能、主题、响应式，P0–P3） |
| 收尾 | `polish` `harden` `clarify` `adapt` `optimize` `onboard` |
| 对着页面改 | `live`（本地开发服务器上选元素换方案）`generate` |
| 准备 | `shape` `init` `document` `extract` |

例子：「`/impeccable polish settings`」。`craft` 在上游是已弃用的别名，不必用。

本安装器只通过 `npx skills` 装入技能。官方 README 里的设计钩子（Agent 改完 UI 自动扫描）要另跑 `npx impeccable install` 才会装上，不在 `scripts/install.sh` 里。

## 05 `ui-ux-pro-max`

**适用场景。** 做新页面、新组件，或给现有产品换一套视觉规则。希望按产品类型得到配色、字体、布局和反模式，后面的页面沿用同一套。

**解决什么问题。** 每一页临时选颜色和字体，产品看起来不像一个产品；也缺少可对照的交付检查项。

**怎么使用。** 在 Claude Code、Cursor、Codex CLI 等上游标明支持自动启用的工具里，直接说设计需求即可，例如：

> 给一家美容店做落地页，要预约按钮和价格表。

也可以点名，尤其是改已有项目：

> 用 ui-ux-pro-max 为这个 React 应用重做主题。风格用 Minimalism & Swiss Style。先看现有的框架、路由和主题 token，保留组件结构和业务逻辑，不要另起一套平行的主题系统。

不说技术栈时，上游默认是 HTML + Tailwind。要 Next.js、Vue、SwiftUI 等，在话里说明。检索脚本需要本机有 Python 3，且不会自己装软件；没有 Python 时让 Agent 告诉你，由你来装。

`/ui-ux-pro-max ...` 这条斜杠命令，上游只写给 Kiro、Roo Code、KiloCode 的 Workflow 模式。Codex、Claude Code、Cursor 用上面的自然语言，不要假设也有这条命令。

## 06 `frontend-design`

**适用场景。** 新建界面，或重做现有界面的观感。先决定这个产品看起来应该像什么，再写页面。

**解决什么问题。** 字体、配色和布局落到与产品无关的通用模板上，看不出页面是给谁用的。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 frontend-design。先根据这个产品是什么、给谁用、主要要完成什么，定出配色、字体和布局，再写页面。不要用放在任何产品上都成立的默认模板。

它和 `ui-ux-pro-max` 可以先后用：前者按这次页面定视觉方向，后者按产品类型给可复用的设计规则。不需要两次都用。

## 07 `vercel-react-best-practices`

**适用场景。** 在写、改或审查 React / Next.js：数据获取、页面、包体积、首屏加载。

**解决什么问题。** 请求一个接一个排队（瀑布），或首屏加载了用不到的代码，页面因此变慢。

**怎么使用。** 没有单独的斜杠命令。技能名就是 `vercel-react-best-practices`。对 Agent 说：

> 用 vercel-react-best-practices 实现这个页面的数据获取。独立的请求不要串行等待。再看首屏是不是加载了太多代码。

或：「按 vercel-react-best-practices 审查这段 React，优先看瀑布请求和包体积。」上游规则按影响排序，这两类是最高优先级。

## 08 `vercel-composition-patterns`

**适用场景。** 一个组件上的 `isXxx`、`showXxx` 之类布尔参数越加越多；或正在做可复用的组件，希望调用方用组合而不是一长串配置。

**解决什么问题。** 布尔开关叠在一起之后，每加一种样子就要再加一个参数，组件难读也难改。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 vercel-composition-patterns 重构这个组件。不要再加布尔参数，改成可组合的部分。

上游把 React 19 的写法单独标出：项目若还是 React 18 或更早，让 Agent 跳过那一节。

## 09 `supabase-postgres-best-practices`

**适用场景。** 写 SQL、建表或改列、做迁移、加索引、写行级权限（RLS）及其测试、看慢查询和 EXPLAIN。数据库是 Postgres 就可以用，不要求一定是 Supabase。

**解决什么问题。** 查询没有合适的索引、连接或锁使用不当、RLS 让不该看见的行被看见。

**怎么使用。** 没有单独的斜杠命令。在写或改数据库相关代码之前对 Agent 说：

> 用 supabase-postgres-best-practices。先按它的规则写这条迁移和 RLS，再改代码。

排查时可以说：「这条查询很慢。用 supabase-postgres-best-practices 看 EXPLAIN，先查索引和查询写法。」

## 10 `surgeon-reviewer`

**适用场景。** 合并前审查一个 PR，或审计 Agent 刚生成的改动。只想知道「这样发出去会不会出故障、影响有多大」。

**解决什么问题。** 审查意见里混着风格、命名和口味，真正会出错、会亏钱或会让下次修改变难的问题被淹没。

**怎么使用。** 它不是 `npx skills` 装进去的技能。安装脚本把上游的子代理文件下载到 `~/.claude/agents/surgeon-reviewer.md`（即使用户只指定了 Cursor，或只要装当前项目，这条路径也不变）。

在 Claude Code 里按上游 README 的说法直接说：

> 用 surgeon-reviewer 审查这个 PR。

它只保留能回答这句话的问题：这段代码照现在发出去，谁会遇到什么具体故障，有多严重。分级只用 WILL BREAK、WILL COST、WILL ROT。结尾是 `SHIP`、`SHIP WITH FIXES` 或 `DO NOT SHIP`。风格、命名、格式化问题它明确不报。

Cursor 和 Codex 不会因为这次安装就自动拥有这个子代理。那些工具里请改说你的审查标准，并说明 `surgeon-reviewer` 文件在 Claude Code 的用户级 agents 目录，不要编造一条斜杠命令。

## 11 `test-driven-development`

**适用场景。** 要实现一个功能、修一个 bug、改一种行为，而且还没写实现代码。也用于重构。

**解决什么问题。** 先写实现再补测试时，测试可能根本没打中要保证的行为。没亲眼看到测试失败，就不知道它会不会在出错时变红。

**怎么使用。** 没有单独的斜杠命令。这是 `obra/superpowers` 里的技能，不是 Matt Pocock 仓库里的 `/tdd`（那一项不在本清单中）。对 Agent 说：

> 用 test-driven-development 做「失败请求最多重试 3 次」。先写测试并确认它因为功能还没实现而失败，再写最少的代码让它通过，最后再重构。写实现之前的生产代码如果已经写了，删掉重来。

上游允许的例外只有：一次性原型、生成代码、配置文件。这些情况让它先问你，而不是默默跳过。

## 12 `webapp-testing`

**适用场景。** 本地网页已经能打开。要当场点击、填表、看截图和浏览器日志，确认一块功能是不是真的工作。

**解决什么问题。** 只读代码就说页面没问题。动态页面还没渲染完就去找按钮，操作会点错。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 webapp-testing。用 Playwright 打开本地这个页面，点击导出，填好表单，截全页图，并把浏览器日志里的报错告诉我。

上游要求用 Python Playwright，并优先调用技能自带的 `scripts/with_server.py`（本地服务还没启动时由它拉起）。动态页面要等加载完成再看 DOM。这是当场验证，不是把测试文件提交进仓库；要可重复的测试文件用 `e2e-tester`。本机需要能跑 Python Playwright，技能不会替你安装。

## 13 `systematic-debugging`

**适用场景。** 任何还没弄清原因的技术问题：测试失败、线上 bug、行为和预期不符、变慢、构建失败、集成对不上。尤其是已经猜着改过一次却没好的时候。

**解决什么问题。** 没稳定复现、没看完报错就改代码，修的是表面现象，根因还在。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 systematic-debugging 查这个失败。先让它稳定复现，读完错误和最近的改动。查清根因之前不要改。

上游的四个阶段要按顺序走完：根因调查、对照模式、提出假设并验证、最后才实现修复。

## 14 `security-review`

**适用场景。** 当前功能分支准备合并，要看这次改动新引入的安全问题，而不是做一次全仓库的风格审查。

**解决什么问题。** 注入、认证与授权漏洞、敏感数据暴露，混在普通功能改动里被一起合并。

**怎么使用。** 脚本会跳过安装。这是 Claude Code 的内置命令，不是本仓库下载的技能文件。

在项目目录打开 Claude Code（桌面端的 Code，或终端里的 `claude`），输入：

```text
/security-review
```

官方说明：它审查当前分支相对 `origin` 默认分支的 diff，需要有 `origin` 远程；关注注入、认证问题和数据暴露这类风险。若失败并出现 `ambiguous argument`，按 Claude Code 自己的错误说明处理，不要猜一条修复命令。

Codex 和 Cursor 没有这条内置命令。不要在那里输入 `/security-review` 并以为本安装包提供了它。若仍想在那些工具里看同类风险，直接描述任务：「只审查当前分支相对默认分支的 diff，看注入、权限和数据暴露」，并说明这不是已安装的 `security-review` 技能。

## 15 `verification-before-completion`

**适用场景。** Agent 正要说「做完了」「修好了」「测试通过了」，或准备提交、开 PR、进入下一步。

**解决什么问题。** 没看这次的命令输出就宣布成功。上次的测试、lint 通过、或「应该好了」，都不能代替刚跑出来的结果。

**怎么使用。** 没有单独的斜杠命令。对 Agent 说：

> 用 verification-before-completion。先别说完成。重新跑能证明这件事的命令，读完最新输出和退出码，再告诉我实际结果。

上游要求：先确定哪条命令能证明这句话，跑完整的命令，读输出、退出码和失败数。对不上就报告实际状态。修 bug 时要针对原来的现象再验证一次，而不是只看代码改过了。

## 16 `web-design-guidelines`

**适用场景。** 审查界面代码是否符合 Vercel 的 Web Interface Guidelines：可访问性、键盘焦点、表单、动效、图片、深色模式等，并且要指到具体文件和行。

**解决什么问题。** 「这里不太好用」没有落点，修的人不知道改哪一行。

**怎么使用。** Vercel 的说明用的是自然语言，没有要求一条单独的斜杠命令。技能可以带文件或匹配模式；你没给的话，它会先问审哪些文件。对 Agent 说：

> 用 web-design-guidelines 审查 src/app 和 src/components。按指南列出问题，用 file:line 标出位置。请包括键盘操作、可见焦点和可访问性。

它读的是技能自带的指南副本，不是临时去网上拉一份规则。

## 17 `e2e-tester`

**适用场景。** 要把一条真实用户路径写成可以反复跑的 Playwright 端到端测试。例如：登录、点导出、确认文件下载成功。

**解决什么问题。** 选择器是猜的、用固定秒数等待、一个流程拆成许多零碎文件，测试一改界面就飘。

**怎么使用。** 没有单独的斜杠命令。安装这一项时脚本加了 `--full-depth`，因为技能在上游仓库较深的目录里；你使用时不用再加这个参数。对 Agent 说：

> 用 e2e-tester，为「登录后点导出，并确认文件下载成功」写 Playwright 端到端测试。先看现有测试有没有覆盖、单元测试是不是更合适。

上游约定包括：有 Playwright MCP 时先打开页面、看结构、走一遍流程，再写测试；选择器优先 `getByRole` 和 `getByLabel`；不要用 `waitForTimeout` 这类固定等待；一个页面的测试放在同一份 spec 里。你说「加一个测试」就只加一条；说「生成完整套件」才写一整组。

它和 `webapp-testing` 的差别：`webapp-testing` 用 Python 当场操作本地页面并看截图和日志；`e2e-tester` 把流程写成可重复运行的 Playwright 测试文件。
