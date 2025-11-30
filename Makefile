include $(TOPDIR)/rules.mk

PKG_NAME:=bettercap
PKG_VERSION:=2.41.3
PKG_RELEASE:=1

PKG_SOURCE:=v2.41.3.tar.gz
PKG_SOURCE_URL:=https://github.com/bettercap/bettercap/archive/refs/tags/
PKG_HASH:=skip

# GOOS:=linux
# GOARCH:=arm64
# CGO_ENABLED:=1

# GO_CFLAGS:=-fPIC
# GO_LDFLAGS:=-fPIC

# export CGO_ENABLED GOOS GOARCH


#https://github.com/bettercap/bettercap/archive/refs/tags/v2.41.3.tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

PKG_BUILD_DEPENDS:=golang/host

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

GO_PKG:=github.com/bettercap/bettercap
GO_PKG_BUILD_PKG:=$(GO_PKG)

define Package/bettercap
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Bettercap - Network attack/monitoring toolkit
  URL:=https://bettercap.org/
  DEPENDS:=$(GO_ARCH_DEPENDS) +libpcap +libusb-1.0
endef

define Package/bettercap/description
Bettercap is a powerful, flexible and portable tool for real-time network
monitoring, traffic manipulation, protocol attacks, and more.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Package/bettercap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/bettercap $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bettercap))
