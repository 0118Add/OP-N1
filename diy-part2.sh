#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.1.10/g' package/base-files/files/bin/config_generate

#使用源码自带ShadowSocksR Plus+出国软件
#sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
git clone https://github.com/fw876/helloworld.git package/helloworld
sed -i 's/ShadowSocksR Plus+/SSR Plus+/g' package/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
rm -rf feeds/luci/collections/luci-lib-docker
rm -rf feeds/luci/applications/luci-app-dockerman
git clone https://github.com/lisaac/luci-lib-docker.git package/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman

#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/trojan
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks

#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks 
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
#git clone https://github.com/Lienol/openwrt-package.git package/openwrt-package
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/xray-core
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/xray-plugin
#svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/simple-obfs
#svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
#svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
#svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone https://github.com/kiddin9/openwrt-bypass.git package/bypass
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
#git clone https://github.com/leshanydy2022/luci-theme-bootstrap-mod.git package/luci-theme-bootstrap-mod
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/openwrt-packages/luci-app-control-timewol
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#git clone https://github.com/bin20088/luci-theme-argon-mc.git package/openwrt-packages/luci-theme-argon-mc
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
#git clone https://github.com/bin20088/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/openwrt-packages/luci-theme-atmaterial
#git clone https://github.com/bin20088/luci-app-koolproxy.git package/openwrt-packages/luci-app-koolproxy
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
#git clone https://github.com/QiuSimons/openwrt-mos.git package/luci-app-mosdns
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
#git clone https://github.com/small-5/luci-app-adblock-plus.git package/luci-app-adblock-plus
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/Unblock Netease Music/g' package/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua
#git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic-mini.git package/luci-app-unblockneteasemusic-mini
#svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-gost package/lean/luci-app-gost
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gost package/lean/gost

#sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
#sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
#sed -i 's/"解锁网易云灰色歌曲"/"网易云音乐"/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po

#readd cpufreq for aarch64
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
#sed -i 's/services/system/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# 修改系统文件
curl -fsSL https://raw.githubusercontent.com/0118Add/OP-N1/main/aarch64/n1_index.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# 添加旁路由防火墙
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# 替换index.htm文件 n1
#wget -O ./package/lean/autocore/files/arm/index.htm https://raw.githubusercontent.com/0118Add/OP-N1/main/aarch64/n1_index.htm

# 替换banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/0118Add/Armbian/main/router/Openwrt_N1/diy/n1_lede/banner

#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile
sed -i '175i\  --with-sandbox=rlimit \\' feeds/packages/net/openssh//Makefile

# 替换内核
#sed -i 's/PATCHVER:=5.15/PATCHVER:=5.10/g' ./target/linux/x86/Makefile

#内核替换 kernel 5.4.183
#sed -i 's/LINUX_KERNEL_HASH-5.4.175 = ac901bdffb1488d6c730ca7ab42322163dd331b240e2f06ad83d199e251a4840/LINUX_KERNEL_HASH-5.4.183 = 2d4b0b77644835410b2a5f599b2893fe199d5542615684207f579753020cc99c/g' ./include/kernel-5.4
#sed -i 's/LINUX_VERSION-5.4 = .175/LINUX_VERSION-5.4 = .183/g' ./include/kernel-5.4
# runc
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.0.2/g' feeds/packages/utils/runc/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33/g' feeds/packages/utils/runc/Makefile
#sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=52b36a2dd837e8462de8e01458bf02cf9eea47dd/g' feeds/packages/utils/runc/Makefile

#replace coremark.sh with the new one
#rm package/lean/coremark/coremark.sh
#cp $GITHUB_WORKSPACE/general/coremark.sh package/lean/coremark/

#赋予koolddns权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns

#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' {}

#修改bypass的makefile
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

./scripts/feeds update -a
./scripts/feeds install -a
