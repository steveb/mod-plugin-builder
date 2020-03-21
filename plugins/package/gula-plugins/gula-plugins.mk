######################################
#
# gxhotbox
#
######################################

GULA_PLUGINS_VERSION = 2a03658679c3bd31b14d40dbd8f9a7469182224d
GULA_PLUGINS_SITE = $(call github,steveb,gula-plugins,$(GULA_PLUGINS_VERSION))
GULA_PLUGINS_DEPENDENCIES = boost
GULA_PLUGINS_BUNDLES = gods_cab.lv2 vibey.lv2 vintage_mics.lv2

GULA_PLUGINS_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)

define GULA_PLUGINS_BUILD_CMDS
	$(GULA_PLUGINS_TARGET_MAKE) all
endef

define GULA_PLUGINS_INSTALL_TARGET_CMDS
	cp -rL $($(PKG)_PKGDIR)/lv2/gods_cab.lv2/* $(TARGET_DIR)/usr/lib/lv2/gods_cab.lv2/
	cp -rL $($(PKG)_PKGDIR)/lv2/vibey.lv2/* $(TARGET_DIR)/usr/lib/lv2/vibey.lv2/
	cp -rL $($(PKG)_PKGDIR)/lv2/vintage_mics.lv2/* $(TARGET_DIR)/usr/lib/lv2/vintage_mics.lv2/
endef

$(eval $(generic-package))
