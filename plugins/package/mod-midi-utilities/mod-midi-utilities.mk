######################################
#
# mod-midi-utilities
#
######################################

MOD_MIDI_UTILITIES_VERSION = d2f8d4ef7d344c6938668de01c01e55dec557bae
MOD_MIDI_UTILITIES_SITE = $(call github,moddevices,mod-midi-utilities,$(MOD_MIDI_UTILITIES_VERSION))
MOD_MIDI_UTILITIES_BUNDLES = midi-switchbox-1inx2out.lv2 midi-switchbox-1inx3out.lv2 midi-switchbox-2inx1out.lv2 midi-switchbox-3inx1out.lv2 midi-switchbox-2inx4out.lv2 midi-switchbox-4inx2out.lv2 peak-to-cc.lv2

MOD_MIDI_UTILITIES_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) NOOPT=true -C $(@D)

define MOD_MIDI_UTILITIES_BUILD_CMDS
	$(MOD_MIDI_UTILITIES_TARGET_MAKE)
endef

define MOD_MIDI_UTILITIES_INSTALL_TARGET_CMDS
	$(MOD_MIDI_UTILITIES_TARGET_MAKE) install DESTDIR=$(TARGET_DIR)
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-1inx2out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-1inx2out.lv2/
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-1inx3out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-1inx3out.lv2/
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-2inx1out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-2inx1out.lv2/
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-2inx4out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-2inx4out.lv2/
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-3inx1out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-3inx1out.lv2/
	cp -rL $($(PKG)_PKGDIR)/midi-switchbox-4inx2out.lv2/* $(TARGET_DIR)/usr/lib/lv2/midi-switchbox-4inx2out.lv2/
endef

$(eval $(generic-package))
