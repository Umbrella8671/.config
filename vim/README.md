# Vim config

这份目录保存个人 Vim 配置。主入口是 `vimrc`。

Vim 会在 `~/.vimrc` 不存在时自动读取：

```text
~/.vim/vimrc
```

## 启用方式

如果这个目录已经是 `~/.vim`，直接启动 Vim 即可：

```sh
vim
```

也可以显式指定这份配置测试：

```sh
vim -Nu ~/.vim/vimrc
```

当前配置会把 Vim 的临时文件放在 `~/.vim/` 内：

| 类型 | 目录 |
| --- | --- |
| viminfo | `~/.vim/viminfo` |
| swap | `~/.vim/swap/` |
| undo | `~/.vim/undo/` |
| backup | `~/.vim/backup/` |

## 基础行为

| 功能 | 设置 |
| --- | --- |
| Leader | `<Space>` |
| 行号 | 绝对行号 + 相对行号 |
| 搜索 | 高亮、增量搜索、智能大小写 |
| 缩进 | 默认 4 空格，使用空格代替 tab |
| 鼠标 | 开启 |
| 分屏 | 新 horizontal split 在下方，新 vertical split 在右侧 |
| 状态栏 | 始终显示文件名、修改状态、行列位置和进度 |
| 参考列 | 第 105 列显示 `colorcolumn` |
| 不可见字符 | 显示 tab 和行尾空格 |
| 颜色 | `termguicolors` + dark background |

## 常用快捷键

`<Leader>` 是空格键。

| 快捷键 | 动作 |
| --- | --- |
| `<Leader><Space>` | 清除搜索高亮 |
| `<Leader>ve` | 编辑当前 Vim 配置 |
| `<Leader>vr` | 重新加载当前 Vim 配置 |
| `<C-s>` | 保存 |
| `<Leader>q` | 退出 |
| `<Leader>Q` | 强制退出，不保存 |

## 窗口和分屏

| 快捷键 | 动作 |
| --- | --- |
| `<C-h>` | 移动到左侧窗口 |
| `<C-j>` | 移动到下方窗口 |
| `<C-k>` | 移动到上方窗口 |
| `<C-l>` | 移动到右侧窗口 |
| `<Leader>sv` | 垂直分屏 |
| `<Leader>sh` | 水平分屏 |
| `<Leader>sc` | 关闭当前窗口 |
| `<Leader>s=` | 平均窗口尺寸 |
| `<Leader>s>` | 当前窗口加宽 |
| `<Leader>s<` | 当前窗口变窄 |
| `<Leader>s+` | 当前窗口变高 |
| `<Leader>s-` | 当前窗口变矮 |

## 文件搜索和全文搜索

这份配置会尝试加载 Homebrew 的 fzf runtime：

```text
/opt/homebrew/opt/fzf/plugin/fzf.vim
```

如果不存在，Vim 仍然可以启动，但 `:Files` 不可用。

### 文件搜索

| 快捷键/命令 | 动作 |
| --- | --- |
| `<Leader>ff` | 用 fzf 搜项目文件 |
| `:Files` | 同上 |

文件列表优先使用：

1. `rg --files`
2. `fd`
3. `find`

### 全文搜索

| 快捷键/命令 | 动作 |
| --- | --- |
| `<Leader>rg` | 输入关键词，用 `rg` 搜全文 |
| `<Leader>rw` | 搜索光标下的单词 |
| `:Rg keyword` | 搜索指定关键词 |

搜索结果会进入 quickfix 窗口。

| 命令 | 动作 |
| --- | --- |
| `:cnext` | 下一个结果 |
| `:cprev` | 上一个结果 |
| `:copen` | 打开 quickfix |
| `:cclose` | 关闭 quickfix |

`rg` 不存在时，`:Rg` 会提示：

```text
rg not found. Install with: brew install ripgrep
```

## 批量替换

Vim 的替换命令格式是：

```vim
:[range]s/旧内容/新内容/[flags]
```

常用 flags：

| Flag | 含义 |
| --- | --- |
| `g` | 替换一行里的所有匹配；不加时每行只替换第一个 |
| `c` | 每次替换前确认 |
| `i` | 忽略大小写 |
| `I` | 区分大小写 |

### 当前文件替换

```vim
:%s/foo/bar/g
```

把当前文件里的所有 `foo` 替换成 `bar`。

带确认：

```vim
:%s/foo/bar/gc
```

只替换第 10 到 30 行：

```vim
:10,30s/foo/bar/g
```

只替换当前行：

```vim
:s/foo/bar/g
```

### 可视区域替换

先用 `v` 或 `V` 选中范围，然后输入：

```vim
:s/foo/bar/g
```

Vim 会自动补成：

```vim
:'<,'>s/foo/bar/g
```

表示只在刚才选中的区域替换。

### 替换特殊字符

如果内容里有 `/`，可以换分隔符：

```vim
:%s#old/path#new/path#g
```

行首、行尾：

```vim
:%s/^/# /g
:%s/$/;/g
```

删除行尾空格：

```vim
:%s/\s\+$//e
```

其中 `e` 表示没有匹配时不报错。

### 多文件替换

先用 `:Rg` 搜出要改的位置：

```vim
:Rg old_name
```

确认 quickfix 里的结果无误后，对 quickfix 里的文件执行替换：

```vim
:cfdo %s/old_name/new_name/gc | update
```

含义：

| 片段 | 含义 |
| --- | --- |
| `cfdo` | 对 quickfix 里的每个文件执行命令 |
| `%s/old/new/gc` | 当前文件全局替换，并逐个确认 |
| `update` | 文件有修改时保存 |

不想逐个确认时去掉 `c`：

```vim
:cfdo %s/old_name/new_name/g | update
```

建议第一次做多文件替换时保留 `c`，确认行为正确后再去掉。

## 文件类型覆盖

| 文件类型 | 缩进/行为 |
| --- | --- |
| Python | 4 空格 |
| Go | tab 缩进，不展开为空格 |
| JSON/YAML | 2 空格 |
| Markdown | `textwidth=80` |

## 剪贴板

如果 Vim 编译时带 `+clipboard`，配置会使用系统剪贴板：

```vim
set clipboard=unnamed,unnamedplus
```

如果没有 `+clipboard`，会按平台尝试使用：

| 平台 | 工具 |
| --- | --- |
| macOS | `pbcopy` / `pbpaste` |
| Wayland | `wl-copy` / `wl-paste` |
| X11 | `xclip` |

## 常见现象

### 为什么有一条红线？

这是第 105 列的参考线：

```vim
set colorcolumn=105
```

### 为什么 `<Leader>ff` 打开后输入框不是空的？

如果在 `nnoremap` 行尾直接写注释，Vim 会把注释文本也当成映射内容。当前配置已经避免这种写法。

### 如何验证配置能否正常启动？

```sh
vim -Nu ~/.vim/vimrc -n --not-a-term -es -c q
```
