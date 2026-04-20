# This script file is used for zsh options, such as history, beep on error

# History options
setopt APPEND_HISTORY        # 持久化历史记录
setopt EXTENDED_HISTORY      # 将历史记录以时间戳存储
setopt HIST_REDUCE_BLANKS    # 去除空白行
setopt HIST_IGNORE_SPACE     # 忽略以空格开头的命令
setopt HIST_IGNORE_ALL_DUPS  # 忽略所有重复的历史记录
setopt SHARE_HISTORY         # 在多个 zsh 会话间共享历史记录
setopt HIST_FIND_NO_DUPS     # 搜索历史时不重复


# Navigate
setopt AUTO_CD             # 自动进入目录
setopt AUTO_PUSHD          # 自动 pushd 目录
setopt PUSHD_IGNORE_DUPS   # 忽略重复目录


## Completion && Correction options
setopt CORRECT             # 自动修正命令
setopt COMPLETE_IN_WORD    # 单词内部补全


## Extended globbing
setopt EXTENDED_GLOB       # 支持扩展的通配符（如 `**`）
setopt GLOB_DOTS           # 允许匹配 `.` 和 `..`

# Other options
setopt NO_CLOBBER             # 防止覆盖文件（必须手动确认）
setopt RM_STAR_WAIT           # 删除 * 文件时等待确认
setopt INTERACTIVE_COMMENTS   # 允许交互式注释


