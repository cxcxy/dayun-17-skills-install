# dayun-17-skills-install

对 AI 说一句话，安装大昀视频里的 **17 项**编程 Agent Skills。

## 第一次（只需一次）

需要本机已安装 [Node.js](https://nodejs.org/) 22+。

```bash
npx skills add cxcxy/dayun-17-skills-install -g -y
```

## 之后怎么用

对新开的 Agent 对话说：

> 帮我安装大昀那 17 项开发技能

AI 会执行本仓库的 `scripts/install.sh`，批量安装清单里的技能。

## 可选参数

```bash
# 只装到 Cursor
DAYUN_SKILLS_AGENTS=cursor bash scripts/install.sh

# 只装当前项目
DAYUN_SKILLS_SCOPE=project bash scripts/install.sh

# 只看将执行的命令
DAYUN_SKILLS_DRY_RUN=1 bash scripts/install.sh
```

## 清单（17 项各自做什么）

| # | Skill | 描述 |
|---|---|---|
| 01 | `grill-with-docs` | 先读项目文档，再逐个追问，把需求里说不清的地方问透，把关键决定记下来。 |
| 02 | `deep-research` | Eric Andrade 版本。选技术方案前查资料、交叉核对，并给结论附上出处。 |
| 03 | `to-spec` | 需求谈妥后，把聊天里定下的方案和验收条件，整理成别人接手就能做的开发规格。 |
| 04 | `impeccable` | 页面做出来后看实际效果，找出排版、交互和视觉细节还需要打磨的地方。 |
| 05 | `ui-ux-pro-max` | 做新项目时按产品类型推荐配色、字体和布局，后面的页面都能沿用这套设计规则。 |
| 06 | `frontend-design` | Anthropic 前端设计技能。先定页面视觉方向，让字体、布局和视觉重点服务于产品。 |
| 07 | `vercel-react-best-practices` | 写 React / Next.js 时用，重点查请求是否排队等待、首屏是否加载了太多代码。 |
| 08 | `vercel-composition-patterns` | 组件开关越加越多时，教你把组件拆成可灵活组合的部分，减少一堆配置参数。 |
| 09 | `supabase-postgres-best-practices` | 写 SQL、建索引、配行级权限时用；项目用 Postgres 即可参考。 |
| 10 | `surgeon-reviewer` | 代码审查子代理。按实际后果给问题排序，说明哪些改动可能出故障、影响有多大。 |
| 11 | `test-driven-development` | 先写测试并确认因功能未实现而失败，再写最少代码让它通过，最后重构。 |
| 12 | `webapp-testing` | 用 Playwright 打开本地网页，点按钮、填表单、看截图和日志，当场确认功能。 |
| 13 | `systematic-debugging` | 遇到异常先复现，再顺着数据和日志找根因，查清楚了再改。 |
| 14 | `security-review` | Claude Code 内置命令（脚本跳过安装）。审查分支改动里的权限与数据暴露风险；聊天框输入 `/security-review`。 |
| 15 | `verification-before-completion` | AI 要说做完了，就重新跑一遍相关检查，看最新结果再下结论。 |
| 16 | `web-design-guidelines` | Vercel 页面审查技能。查键盘操作、焦点提示和可访问性，并定位到文件与行。 |
| 17 | `e2e-tester` | 把真实用户流程写成可重复运行的 Playwright 测试，例如点导出后再确认文件下载成功。 |

安装来源与批次合并方式见 [catalog.md](./catalog.md)。
