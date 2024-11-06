
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
#Assignment4 part 2:
#AESD_ASSIGNMENTS_VERSION = '43e6c4501b016e1ed16480a98714d706bcd96e99'

#Assignment5 part 2:
#AESD_ASSIGNMENTS_VERSION = '1644e63cb2b86209b3cd4b393984165a32a23c70'
#AESD_ASSIGNMENTS_VERSION = '0915b936e72d192d5a76ada1e789e7b665baa88c'
#AESD_ASSIGNMENTS_VERSION = '0ee0cb70c8b824dbef03cfd10d6ffb978262e133'

#Assignment8:
#AESD_ASSIGNMENTS_VERSION = '1d2824c1b49adf4b87582776d3bb19fc9e8ff5ac'


#Assignment9:
AESD_ASSIGNMENTS_VERSION = 'dfff40eaa83011fd17a97de935d300ab7cb08b95'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-shpr8875.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef


AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

$(eval $(kernel-module))


# add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	#$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	#$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	#$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	
	#$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/root
	#$(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/root
	#$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/root
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
    	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
  	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/sbin/
    	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/sbin/  	
    	
    	
	
endef

$(eval $(generic-package))
