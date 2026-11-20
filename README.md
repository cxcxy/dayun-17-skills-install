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

## 清单

详见 [catalog.md](./catalog.md)。`security-review` 为 Claude Code 内置命令，脚本会跳过并提示用法。
