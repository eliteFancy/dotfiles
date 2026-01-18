#!/bin/bash



# 获取仓库的绝对路径

DOTFILES_DIR=~/gits/dotfiles



# 定义你需要管理的文件列表（以后增加了新文件，只需加在这里）

FILES=".bashrc"



echo "开始安装配置文件..."



for FILE in $FILES; do

    TARGET="$HOME/$FILE"

    SOURCE="$DOTFILES_DIR/$FILE"



    # 情况 1：如果目标位置已经是一个软链接，先删除它以便更新

    if [ -L "$TARGET" ]; then

        echo "提示：移除已存在的旧链接 $TARGET"

        rm "$TARGET"

    # 情况 2：如果目标位置是一个真实文件，先备份它（你提到的安全做法）

    elif [ -f "$TARGET" ]; then

        echo "提示：发现原有的真实文件，备份为 ${TARGET}.bak"

        mv "$TARGET" "${TARGET}.bak"

    fi



    # 创建软链接：让系统路径指向仓库里的真身

    echo "创建链接: $TARGET -> $SOURCE"

    ln -s "$SOURCE" "$TARGET"

done



echo "安装完成！请执行 'source ~/.bashrc' 或重启终端查看效果。"
