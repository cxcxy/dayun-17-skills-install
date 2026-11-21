# 大昀 17 项 · 安装目录

核对基准：2026-11-20 视频清单。自动安装以 `scripts/install.sh` 为准。本文件只记录安装来源和批次。每项的适用场景、解决的问题和用法见 [USAGE.md](./USAGE.md)。

| # | 名称 | 描述 | 方式 | 来源 |
|---|---|---|---|---|
| 01 | `grill-with-docs` | 先读项目文档，再逐个追问，把需求问透并记下关键决定 | `npx skills` | `mattpocock/skills` |
| 02 | `deep-research` | 查资料、交叉核对，结论附出处（Eric Andrade 版） | `npx skills` | `ericgandrade/claude-superskills` |
| 03 | `to-spec` | 把共识方案与验收条件整理成可接手的开发规格 | `npx skills` | `mattpocock/skills` |
| 04 | `impeccable` | 看实际页面效果，打磨排版、交互与视觉细节 | `npx skills` | `pbakaus/impeccable` |
| 05 | `ui-ux-pro-max` | 按产品类型推荐配色、字体和布局并可供后续复用 | `npx skills` | `nextlevelbuilder/ui-ux-pro-max-skill` |
| 06 | `frontend-design` | 先定前端视觉方向，让字体、布局服务产品 | `npx skills` | `anthropics/skills` |
| 07 | `vercel-react-best-practices` | React/Next 性能：串行请求、首屏体积等 | `npx skills` | `vercel-labs/agent-skills` |
| 08 | `vercel-composition-patterns` | 用组合拆组件，减少布尔开关堆叠 | `npx skills` | `vercel-labs/agent-skills` |
| 09 | `supabase-postgres-best-practices` | Postgres：SQL、索引、行级权限 | `npx skills` | `supabase/agent-skills` |
| 10 | `surgeon-reviewer` | 按实际故障影响排序的代码审查子代理 | 下载子代理文件 | `LucianFord/agent-pack` → `agents/surgeon-reviewer.md` |
| 11 | `test-driven-development` | 先写失败测试，再最小实现，再重构 | `npx skills` | `obra/superpowers` |
| 12 | `webapp-testing` | Playwright 操作本地网页并查看截图与日志 | `npx skills` | `anthropics/skills` |
| 13 | `systematic-debugging` | 先复现，再查根因，再修复 | `npx skills` | `obra/superpowers` |
| 14 | `security-review` | 审查分支改动的权限与数据暴露风险 | 内置，跳过安装 | Claude Code `/security-review` |
| 15 | `verification-before-completion` | 宣布完成前重跑检查并看最新输出 | `npx skills` | `obra/superpowers` |
| 16 | `web-design-guidelines` | 按网页规范审可访问性等问题并定位到行 | `npx skills` | `vercel-labs/agent-skills` |
| 17 | `e2e-tester` | 把真实用户流程写成可重复 Playwright E2E | `npx skills` | `PageAI-Pro/ralph-loop`（需 `--full-depth`） |

## 批次（脚本内部合并）

1. `mattpocock/skills` → `grill-with-docs` `to-spec`
2. `ericgandrade/claude-superskills` → `deep-research`
3. `pbakaus/impeccable` → `impeccable`
4. `nextlevelbuilder/ui-ux-pro-max-skill` → `ui-ux-pro-max`
5. `anthropics/skills` → `frontend-design` `webapp-testing`
6. `vercel-labs/agent-skills` → `vercel-react-best-practices` `vercel-composition-patterns` `web-design-guidelines`
7. `supabase/agent-skills` → `supabase-postgres-best-practices`
8. `obra/superpowers` → `test-driven-development` `systematic-debugging` `verification-before-completion`
9. `PageAI-Pro/ralph-loop` → `e2e-tester`（`--full-depth`）
10. 特殊：`surgeon-reviewer` 原始文件下载
11. 跳过：`security-review`
