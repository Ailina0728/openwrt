#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#sed -i '$a src-git 281677160 https://github.com/281677160/openwrt-package' feeds.conf.default

sed -i '$a src-git darkmatter https://github.com/apollo-ng/luci-theme-darkmatter.git' feeds.conf.default

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr 
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme-argon
rm -rf ../lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Add luci-theme-infinityfreedom
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom

# Add luci-theme-atmaterial
svn co https://github.com/281677160/openwrt-package/trunk/luci-theme-atmaterial

# Add luci-app-advancedsetting
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-advancedsetting

# Add luci-app-smartinfo
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-smartinfo

# Add luci-app-dnsfilter
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-dnsfilter

# Add luci-theme-opentomcat
svn co https://github.com/281677160/openwrt-package/trunk/luci-theme-opentomcat

# Add luci-theme-opentopd
svn co https://github.com/281677160/openwrt-package/trunk/luci-theme-opentopd

# Add luci-theme-rosy
svn co https://github.com/281677160/openwrt-package/trunk/luci-theme-rosy

# Add luci-app-ttnode
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-ttnode

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-udptools
git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https_dns_proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Add luci-AdGuardHome
git clone --depth=1 https://github.com/AdguardTeam/AdGuardHome

# Change default shell to zsh
#sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Mod zzz-default-settings
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
#popd

# Add luci-app-adguardhome
cp -r temp/luci/applications/luci-app-adguardhome luci/applications/luci-app-adguardhome
cp -r temp/packages/net/adguardhome packages/net/adguardhome
cp -r temp/packages/lang/node-yarn packages/lang/node-yarn
cp -r temp/packages/devel/packr packages/devel/packr

# Add luci-app-gowebdav
#cp -r temp/luci/applications/luci-app-gowebdav luci/applications/luci-app-gowebdav
#cp -r temp/packages/net/gowebdav packages/net/gowebdav

# Add netdata
rm -rf packages/admin/netdata
rm -rf ../package/lean/luci-app-netdata
cp -r temp/luci/applications/luci-app-netdata luci/applications/luci-app-netdata
cp -r temp/packages/admin/netdata packages/admin/netdata

# Add luci-app-smartdns
#cp -r temp/luci/applications/luci-app-smartdns luci/applications/luci-app-smartdns
#cp -r temp/packages/net/smartdns packages/net/smartdns

# Add tmate
#cp -r temp/packages/net/tmate packages/net/tmate
#cp -r temp/packages/libs/msgpack-c packages/libs/msgpack-c

# Add gotop
#cp -r temp/packages/admin/gotop packages/admin/gotop

# Add minieap
cp -r temp/packages/net/minieap packages/net/minieap
rm -rf temp
popd

