# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=IntoTheShadow Kernel - zaidannn7
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=juice
supported.versions=
supported.patchlevels=
'; } # end properties

ui_print ""

# AnyKernel install
# begin attributes
attributes() {
    set_perm_recursive 0 0 755 644 $ramdisk/*;
    set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes

## shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

### AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel boot install
dump_boot;

# Remove ramdisk overlay if any
if [ -d \$ramdisk/overlay ]; then
    rm -rf \$ramdisk/overlay;
fi;

write_boot;
## end boot install
