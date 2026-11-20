# 大昀 17 项 · 安装目录

核对基准：2026-11-20 视频清单。自动安装以 `scripts/install.sh` 为准。

| # | 名称 | 方式 | 来源 |
|---|---|---|---|
| 01 | `grill-with-docs` | `npx skills` | `mattpocock/skills` |
| 02 | `deep-research` | `npx skills` | `ericgandrade/claude-superskills` |
| 03 | `to-spec` | `npx skills` | `mattpocock/skills` |
| 04 | `impeccable` | `npx skills` | `pbakaus/impeccable` |
| 05 | `ui-ux-pro-max` | `npx skills` | `nextlevelbuilder/ui-ux-pro-max-skill` |
| 06 | `frontend-design` | `npx skills` | `anthropics/skills` |
| 07 | `vercel-react-best-practices` | `npx skills` | `vercel-labs/agent-skills` |
| 08 | `vercel-composition-patterns` | `npx skills` | `vercel-labs/agent-skills` |
| 09 | `supabase-postgres-best-practices` | `npx skills` | `supabase/agent-skills` |
| 10 | `surgeon-reviewer` | 下载子代理文件 | `LucianFord/agent-pack` → `agents/surgeon-reviewer.md` |
| 11 | `test-driven-development` | `npx skills` | `obra/superpowers` |
| 12 | `webapp-testing` | `npx skills` | `anthropics/skills` |
| 13 | `systematic-debugging` | `npx skills` | `obra/superpowers` |
| 14 | `security-review` | 内置，跳过安装 | Claude Code `/security-review` |
| 15 | `verification-before-completion` | `npx skills` | `obra/superpowers` |
| 16 | `web-design-guidelines` | `npx skills` | `vercel-labs/agent-skills` |
| 17 | `e2e-tester` | `npx skills` | `PageAI-Pro/ralph-loop`（需 `--full-depth`） |

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

## 用途一句话（方便安装后告诉用户）

| # | 干什么 |
|---|---|
| 01 | 读文档后追问，把需求问透并记决定 |
| 02 | 查资料、交叉核对、结论带来源 |
| 03 | 把共识整理成可接手的开发规格 |
| 04 | 审页面、打磨视觉与交互细节 |
| 05 | 按产品类型给配色、字体、布局建议 |
| 06 | 先定前端视觉方向 |
| 07 | React/Next 性能：串行请求、首屏体积等 |
| 08 | 组件组合，少堆布尔开关 |
| 09 | Postgres：SQL、索引、RLS |
| 10 | 按实际故障影响排序的代码审查子代理 |
| 11 | 先写失败测试，再最小实现，再重构 |
| 12 | Playwright 操作本地网页并看结果 |
| 13 | 先复现再查根因再改 |
| 14 | 审查分支改动的权限与数据暴露风险 |
| 15 | 说完成前重新跑检查并看最新输出 |
| 16 | 按网页界面规范审可访问性等问题 |
| 17 | 把真实用户流程写成可重复 E2E |
