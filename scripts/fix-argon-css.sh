#change luci-theme-argon default css file
###
 # @Author: zhkong
 # @Date: 2023-08-25 00:06:13
 # @LastEditors: zhkong
 # @LastEditTime: 2023-08-25 00:08:57
 # @FilePath: /xiaomi-ax3600-openwrt-build/scripts/fix-argon.sh
### 
mkdir -p files/www/luci-static/argon/css
wget https://github.com/jerrykuku/luci-theme-argon/raw/master/htdocs/luci-static/argon/css/cascade.css -O files/www/luci-static/argon/css/cascade.css
wget https://github.com/jerrykuku/luci-theme-argon/raw/master/htdocs/luci-static/argon/css/dark.css -O files/www/luci-static/argon/css/dark.css
