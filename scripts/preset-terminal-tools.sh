###
# @Author: zhkong
# @Date: 2023-08-07 01:49:18
# @LastEditors: zhkong
# @LastEditTime: 2023-08-07 01:53:26
# @FilePath: /xiaomi-ax3600-openwrt-build/scripts/preset-terminal-tools.sh
###

mkdir -p files/root

## Install oh-my-zsh
# Clone oh-my-zsh repository
git clone https://github.com/robbyrussell/oh-my-zsh files/root/.oh-my-zsh

# Install extra plugins
git clone https://github.com/zsh-users/zsh-autosuggestions files/root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git files/root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions files/root/.oh-my-zsh/custom/plugins/zsh-completions

# Get .zshrc dotfile
cp ../data/zsh/.zshrc ./files/root/.zshrc

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
