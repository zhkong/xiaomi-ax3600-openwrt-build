###
# @Author: zhkong
# @Date: 2023-07-25 17:07:02
 # @LastEditors: zhkong
 # @LastEditTime: 2023-07-31 17:07:53
 # @FilePath: /xiaomi-ax3600-openwrt-build/scripts/prepare.sh
# @Description: Do not edit
###

git clone https://github.com/zhkong/openwrt-ipq807x.git -b qualcommax-6.1-nss --single-branch openwrt
cd openwrt

### 基础部分 ###
# 使用 O2 级别的优化
sed -i 's/Os/O2/g' include/target.mk
# 更新 Feeds
./scripts/feeds update -a
./scripts/feeds install -a
# 默认开启 Irqbalance
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
# 移除 SNAPSHOT 标签
sed -i 's,-SNAPSHOT,,g' include/version.mk
sed -i 's,-SNAPSHOT,,g' package/base-files/image-config.in

# 添加第三方软件包
git clone https://github.com/vernesong/OpenClash.git --single-branch --depth 1 package/new/luci-openclash
git clone https://github.com/jerrykuku/luci-theme-argon.git --single-branch --depth 1 package/new/luci-theme-argon
git clone https://github.com/cokebar/openwrt-vlmcsd.git --single-branch --depth 1 package/new/openwrt-vlmcsd
git clone https://github.com/cokebar/luci-app-vlmcsd.git --single-branch --depth 1 package/new/luci-app-vlmcsd

# AutoCore
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/emortal/autocore package/new/autocore
sed -i 's/"getTempInfo" /"getTempInfo", "getCPUBench", "getCPUUsage" /g' package/new/autocore/files/luci-mod-status-autocore.json

rm -rf feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
rm -rf feeds/packages/utils/coremark

svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/modules/luci-base feeds/luci/modules/luci-base
# sed -i "s,(br-lan),,g" feeds/luci/modules/luci-base/root/usr/share/rpcd/ucode/luci
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/modules/luci-mod-status feeds/luci/modules/luci-mod-status
svn export https://github.com/immortalwrt/packages/branches/openwrt-23.05/utils/coremark feeds/packages/utils/coremark
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/utils/mhz package/utils/mhz

# config file
# cp config/xiaomi_ax3600-stock.config .config
cp config/.config ./config
make defconfig

# # 编译固件
make download -j$(nproc)
make -j$(nproc) || make -j1 V=s
