#!/bin/bash

echo -e "\nStarting\n"

###############################
# STEP 1 Checking args
###############################
echo -e "Checking args\n"
# RESET
PORT_FILE=""
BASE_FILE=""
PORT_DIR=""
BASE_DIR=""

if [ -z "${1}" ]; then 
echo -e "\tArg 1 not found, using default: port.zip\n"
PORT_FILE="port.zip"
else
echo -e "\tArg 1 found: ${1}\n"
PORT_FILE="${1}"
fi

if [ -z "${2}" ]; then 
echo -e "\tArg 2 not found, using default: base.zip\n"
BASE_FILE="base.zip"
else
echo -e "\tArg 2 found: ${2}\n"
BASE_FILE="${2}"
fi

PORT_DIR="${PORT_FILE%.*}"
BASE_DIR="${BASE_FILE%.*}"

###############################
# STEP 2 Checking dirs
###############################
echo -e "Checking dirs and files\n"
if [ ! -f "${PORT_FILE}" ]; then echo -e "${PORT_FILE} not found\n" ; return 0 ; fi
if [ ! -f "${BASE_FILE}" ]; then echo -e "${BASE_FILE} not found\n" ; return 0 ; fi
if [ -d "${BASE_DIR}" ]; then rm -fr "${BASE_DIR}" ; fi
if [ -d "${PORT_DIR}" ]; then rm -fr "${PORT_DIR}" ; fi

if [ -d log ]; then
rm -fr log
mkdir log
else
mkdir log
fi

###############################
# STEP 3 Extracting
###############################
echo -e "Extracting\n"

unzip "${BASE_FILE}" -d "${BASE_DIR}" &>log/unzip-base.log
unzip "${PORT_FILE}" -d "${PORT_DIR}" &>log/unzip-port.log

###############################
# STEP 4 Patching
# STEP 4a Cleaning
###############################
echo -e "Patching\n"
echo -e "\tCleaning"

rm -fr "${PORT_DIR}/boot.img"
rm -fr "${PORT_DIR}/system/lib/hw"
rm -fr "${PORT_DIR}/system/lib/modules"
rm -fr "${PORT_DIR}/system/etc/firmware"
rm -fr "${PORT_DIR}/system/etc/apns-conf.xml"
rm -fr "${PORT_DIR}/system/etc/agps_profiles_conf.xml"
rm -fr "${PORT_DIR}/system/media/images"
rm -fr "${PORT_DIR}/system/media/bootanimation.zip"
rm -fr "${PORT_DIR}/system/media/shutanimation.zip"
rm -fr "${PORT_DIR}/system/lib/lib3a.so"
rm -fr "${PORT_DIR}/system/lib/liba3m.so"
rm -fr "${PORT_DIR}/system/lib/libfeatureio.so"
rm -fr "${PORT_DIR}/system/lib/libimageio.so"
rm -fr "${PORT_DIR}/system/lib/libja3m.so"
rm -fr "${PORT_DIR}/system/lib/libcam.camadapter.so"
rm -fr "${PORT_DIR}/system/lib/libcam.campipe.so"
rm -fr "${PORT_DIR}/system/lib/libcam.camshot.so"
rm -fr "${PORT_DIR}/system/lib/libcam.client.so"
rm -fr "${PORT_DIR}/system/lib/libcam.paramsmgr.so"
rm -fr "${PORT_DIR}/system/lib/libcam.utils.so"
rm -fr "${PORT_DIR}/system/lib/libcam_camera_exif.so"
rm -fr "${PORT_DIR}/system/lib/libcamalgo.so"
rm -fr "${PORT_DIR}/system/lib/libcamdrv.so"
rm -fr "${PORT_DIR}/system/lib/libcamera_client.so"
rm -fr "${PORT_DIR}/system/lib/libcamera_metadata.so"
rm -fr "${PORT_DIR}/system/lib/libcameracustom.so"
rm -fr "${PORT_DIR}/system/lib/libcameraservice.so"
rm -fr "${PORT_DIR}/system/lib/libcustom_nvram.so"
rm -fr "${PORT_DIR}/system/lib/libgcomm_jni.so"
rm -fr "${PORT_DIR}/system/lib/libgn_camera_feature.so"
rm -fr "${PORT_DIR}/system/lib/libmtk_vt_client.so"
rm -fr "${PORT_DIR}/system/lib/libmtk_vt_service.so"
rm -fr "${PORT_DIR}/system/lib/libmtk_vt_swip.so"
rm -fr "${PORT_DIR}/system/lib/libwebcore.so"
rm -fr "${PORT_DIR}/system/etc/init.d"
rm -fr "${PORT_DIR}/system/lib/hw/camera.default.so"
rm -fr "${PORT_DIR}/system/lib/hw/hwcomposer.mt6589.so"
rm -fr "${PORT_DIR}/system/lib/hw/sensors.default.so"
rm -fr "${PORT_DIR}/system/etc/gps.conf"
rm -fr "${PORT_DIR}/system/etc/SuplRootCert"
rm -fr "${PORT_DIR}/system/xbin/mnld"
rm -fr "${PORT_DIR}/system/xbin/libmnlp_mt6628"
rm -fr "${PORT_DIR}/system/vendor"

###############################
# STEP 4 Patching
# STEP 4b Copying
###############################
echo -e "\tCopying\n"

cp "${BASE_DIR}/boot.img" "${PORT_DIR}/boot.img"
cp -a "${BASE_DIR}/system/lib/hw" "${PORT_DIR}/system/lib/hw"
cp -a "${BASE_DIR}/system/lib/modules" "${PORT_DIR}/system/lib/modules"
cp -a "${BASE_DIR}/system/etc/firmware" "${PORT_DIR}/system/etc/firmware"
cp "${BASE_DIR}/system/etc/apns-conf.xml" "${PORT_DIR}/system/etc/apns-conf.xml"
cp "${BASE_DIR}/system/etc/agps_profiles_conf.xml" "${PORT_DIR}/system/etc/agps_profiles_conf.xml"
cp -a "${BASE_DIR}/system/media/images" "${PORT_DIR}/system/media/images"
cp "${BASE_DIR}/system/media/bootanimation.zip" "${PORT_DIR}/system/media/bootanimation.zip"
#cp "${BASE_DIR}/system/media/shutanimation.zip" "${PORT_DIR}/system/media/shutanimation.zip"
cp "${BASE_DIR}/system/lib/lib3a.so" "${PORT_DIR}/system/lib/lib3a.so"
cp "${BASE_DIR}/system/lib/liba3m.so" "${PORT_DIR}/system/lib/liba3m.so"
cp "${BASE_DIR}/system/lib/libfeatureio.so" "${PORT_DIR}/system/lib/libfeatureio.so"
cp "${BASE_DIR}/system/lib/libimageio.so" "${PORT_DIR}/system/lib/libimageio.so"
cp "${BASE_DIR}/system/lib/libja3m.so" "${PORT_DIR}/system/lib/libja3m.so"
cp "${BASE_DIR}/system/lib/libcam.camadapter.so" "${PORT_DIR}/system/lib/libcam.camadapter.so"
cp "${BASE_DIR}/system/lib/libcam.campipe.so" "${PORT_DIR}/system/lib/libcam.campipe.so"
cp "${BASE_DIR}/system/lib/libcam.camshot.so" "${PORT_DIR}/system/lib/libcam.camshot.so"
cp "${BASE_DIR}/system/lib/libcam.client.so" "${PORT_DIR}/system/lib/libcam.client.so"
cp "${BASE_DIR}/system/lib/libcam.paramsmgr.so" "${PORT_DIR}/system/lib/libcam.paramsmgr.so"
cp "${BASE_DIR}/system/lib/libcam.utils.so" "${PORT_DIR}/system/lib/libcam.utils.so"
cp "${BASE_DIR}/system/lib/libcam_camera_exif.so" "${PORT_DIR}/system/lib/libcam_camera_exif.so"
cp "${BASE_DIR}/system/lib/libcamalgo.so" "${PORT_DIR}/system/lib/libcamalgo.so"
cp "${BASE_DIR}/system/lib/libcamdrv.so" "${PORT_DIR}/system/lib/libcamdrv.so"
cp "${BASE_DIR}/system/lib/libcamera_client.so" "${PORT_DIR}/system/lib/libcamera_client.so"
cp "${BASE_DIR}/system/lib/libcamera_metadata.so" "${PORT_DIR}/system/lib/libcamera_metadata.so"
cp "${BASE_DIR}/system/lib/libcameracustom.so" "${PORT_DIR}/system/lib/libcameracustom.so"
cp "${BASE_DIR}/system/lib/libcameraservice.so" "${PORT_DIR}/system/lib/libcameraservice.so"
cp "${BASE_DIR}/system/lib/libcustom_nvram.so" "${PORT_DIR}/system/lib/libcustom_nvram.so"
#cp "${BASE_DIR}/system/lib/libgcomm_jni.so" "${PORT_DIR}/system/lib/libgcomm_jni.so"
#cp "${BASE_DIR}/system/lib/libgn_camera_feature.so" "${PORT_DIR}/system/lib/libgn_camera_feature.so"
cp "${BASE_DIR}/system/lib/libmtk_vt_client.so" "${PORT_DIR}/system/lib/libmtk_vt_client.so"
cp "${BASE_DIR}/system/lib/libmtk_vt_service.so" "${PORT_DIR}/system/lib/libmtk_vt_service.so"
cp "${BASE_DIR}/system/lib/libmtk_vt_swip.so" "${PORT_DIR}/system/lib/libmtk_vt_swip.so"
cp "${BASE_DIR}/system/lib/libwebcore.so" "${PORT_DIR}/system/lib/libwebcore.so"
cp -a "${BASE_DIR}/system/etc/init.d" "${PORT_DIR}/system/etc/init.d"
cp "${BASE_DIR}/system/lib/hw/camera.default.so" "${PORT_DIR}/system/lib/hw/camera.default.so"
cp "${BASE_DIR}/system/lib/hw/hwcomposer.mt6589.so" "${PORT_DIR}/system/lib/hw/hwcomposer.mt6589.so"
cp "${BASE_DIR}/system/lib/hw/sensors.default.so" "${PORT_DIR}/system/lib/hw/sensors.default.so"
cp "${BASE_DIR}/system/etc/gps.conf" "${PORT_DIR}/system/etc/gps.conf"
#cp -a "${BASE_DIR}/system/etc/SuplRootCert" "${PORT_DIR}/system/etc/SuplRootCert"
cp "${BASE_DIR}/system/xbin/mnld" "${PORT_DIR}/system/xbin/mnld"
cp "${BASE_DIR}/system/xbin/libmnlp_mt6628" "${PORT_DIR}/system/xbin/libmnlp_mt6628"
cp -a "${BASE_DIR}/system/vendor" "${PORT_DIR}/system/vendor"


###############################
# STEP 5 Zipping
###############################
echo -e "Prepare to zipping\n"
if [ -d temp ]; then
rm -fr temp
mkdir temp
else
mkdir temp
fi

cp -a "${PORT_DIR}/system" "temp/system"
cp -a "${BASE_DIR}/META-INF" "temp/META-INF"
cp "${PORT_DIR}/META-INF/com/google/android/updater-script" "temp/META-INF/com/google/android/updater-script-port"
cp "${PORT_DIR}/boot.img" "temp/boot.img"
cp "${BASE_DIR}/system/build.prop" "temp/system/build-base.prop"

echo -e "Now go to temp/META-INF and prepare updater-script"
echo -e "\tand temp/system/build.prop"
echo -e "\tIf you are porting MIUI or LewaOS you need add to"
echo -e "\tBOOTCLASSPATH in ramdisk init.rc specific framework of ROM"
echo -e "\tAlso you can clean up ROM if you want"

NEXT_CHECK=""
CONTINUE_CHECK=""
until [ "${CONTINUE_CHECK}" = "x" ] ; do
echo -e "\n\tt\tDowload tool for repack boot.img"
echo -e "\tp\tExecute prepare.sh (if exist)"
echo -e "\tc\tConinue the script\n"
read -p "What do you want? " NEXT_CHECK
case "$NEXT_CHECK" in
"t") git clone https://github.com/Dr-Shadow/mtk-tools.git ;;
"p") . prepare.sh ;;
"c") CONTINUE_CHECK=x ;;
"exit") exit 0 ;;
*) echo -e "\nTry to enter key again" 
esac
done
echo -e "\nContinuing\n" 

echo -e "Zipping\n"
READY_ROM="${PORT_DIR}_PORTED"_`date +%Y-%m-%d-%H.%M.%S`
cd temp
zip -r ${READY_ROM}.zip system META-INF boot.img &>../log/zipping.log
cd ..
cp "temp/${READY_ROM}.zip" "${READY_ROM}.zip"
rm -fr temp
echo -e "\tYour ported ROM:\n\t\t\t${READY_ROM}.zip\n"

###############################
# STEP 6 Pushing
###############################
read -p "Push the ROM to phone using \"adb sideload\" [y]: " PUSH
if [ "${PUSH}" == "y" ]; then
echo -e "Pushing\n"
sudo adb kill-server
sudo adb devices
sudo adb sideload "${READY_ROM}.zip"
fi
echo -e "The END\n"
###############################
# project WIP but should working fine
###############################