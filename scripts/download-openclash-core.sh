mkdir -p ./files/etc/openclash/core

wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz
tar zxvf clash-linux-arm64.tar.gz && rm -f clash-linux-arm64.tar.gz
mv ./clash ./files/etc/openclash/core/clash

wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/clash-linux-arm64-2023.08.17-13-gdcc8d87.gz -O clash_tun.gz
gzip -d clash_tun.gz
chmod +x clash_tun
mv ./clash_tun ./files/etc/openclash/core/clash_tun

wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz
tar zxvf clash-linux-arm64.tar.gz && rm -f clash-linux-arm64.tar.gz
mv ./clash ./files/etc/openclash/core/clash_meta
