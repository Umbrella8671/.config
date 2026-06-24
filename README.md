# dotconfig

> 个人 `~/.config` 配置文件仓库，集中管理各类开发工具的配置。

---

## 目录结构

```
~/.config/
├── zsh/          # Zsh shell 配置
├── nvim/         # Neovim 编辑器配置
├── tmux/         # Tmux 终端复用器配置
├── uv/           # uv Python 包管理器配置
└── pip/          # pip 配置
```

---

## 配置说明

### Zsh (`zsh/`)

模块化的 Zsh 配置，通过 `zshrc` 按顺序加载各模块：

| 文件 | 说明 |
|------|------|
| `zshrc` | 主入口，依次 source 各模块 |
| `environments.zsh` | 环境变量（PATH、工具路径等） |
| `options.zsh` | Zsh 选项（历史记录、补全行为等） |
| `aliases.zsh` | 命令别名 |
| `functions.zsh` | 自定义函数 |
| `completions.zsh` | 补全设置 |
| `keymaps.zsh` | 键位绑定 |
| `theme.zsh` | 提示符主题 |
| `secrets.zsh` | 敏感信息（已加入 `.gitignore`，不跟踪） |

**Zsh 插件**（位于 `zsh/plugins/`，手动管理）：

- `zsh-autosuggestions` — 历史命令自动建议
- `zsh-history-substring-search` — 历史子串搜索
- `fast-syntax-highlighting` — 命令行语法高亮
- `fzf-tab` — fzf 驱动的 Tab 补全
- `git-info` — Git 状态信息
- `prompt-pwd` — 提示符路径显示
- `duration-info` — 命令执行时长显示
- `magicmace` — 魔法命令增强

**启用方式**：将 `zshrc` 软链接到 `~/.zshrc`：

```bash
ln -sf ~/.config/zsh/zshrc ~/.zshrc
```

---

## .gitignore 说明

以下内容不纳入版本控制：

- `zsh/secrets.zsh` — 敏感环境变量（API Key 等）
- `git/` — Git 个人配置（含邮箱等隐私信息）
- `claude/`、`copilot/`、`gemini/`、`codex/` — AI 工具运行时数据
- `jupyter/`、`ipython/`、`wandb/` — 工具缓存与运行时状态
- `.DS_Store` — macOS 系统文件

---

## License

[Apache License 2.0](LICENSE)
