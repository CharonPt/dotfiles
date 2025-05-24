unsetopt beep

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/charon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# About alias
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'

# Created by `pipx` on 2025-04-29 14:08:42
export PATH="$PATH:/home/charon/.local/bin"

# About neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Function
ida() {
    # 指定 IDA 的安装目录
    local ida_dir="/mnt/d/IDA9.1"  # 请将此路径替换为 IDA 安装目录

    # 检查 IDA 是否存在于该目录
    if [[ -f "$ida_dir/ida.exe" ]]; then
        # 运行 ida.exe 并传递所有参数
        "$ida_dir/ida.exe" "$@"
    else
        echo "Error: ida.exe not found in $ida_dir"
    fi
}
typora() {
    local exe_dir="/mnt/d/Typora"  

    if [[ -f "$exe_dir/Typora.exe" ]]; then
        "$exe_dir/Typora.exe" "$@"
    else
        echo "Error: Typora.exe not found in $exe_dir"
    fi
}


function tot() {
  # 检查是否提供了第二个参数
  if [ $# -lt 1 ]; then
    echo "usage: tothis <program_name>"
    return 1
  fi

  # 定义源文件路径，需要替换为你实际的文件路径
  source_file="/home/charon/tools/pwn.py"
  # 目标文件路径为当前目录下的同名文件
  if [ $# -ge 2 ]; then
    target_file="./$2"
  else
    target_file="./1.py"
  fi

  if [ -e "$target_file" ]; then
    echo "File already exists"
    return 1
  fi

  # 拷贝文件
  if ! cp "$source_file" "$target_file" ; then
    echo "Missing script file"
    return 1
  fi

  # 要替换的特定字符串，需要替换为你实际要替换的字符串
  old_string=".\/pwn"
  new_string=".\/$1"

  # 使用 sed 命令替换文件中的字符串
  sed -i "s/$old_string/$new_string/g" "$target_file"
}
