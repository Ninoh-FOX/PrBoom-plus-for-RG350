#!/bin/sh

OPK_NAME=prboom+.opk

echo ${OPK_NAME}

# create prboom.gcw0.desktop
cat > prboom.gcw0.desktop <<EOF
[Desktop Entry]
Name=PrBoom+
Comment=doom engine for RG350
Exec=prboom-launcher %f
Terminal=false
Type=Application
StartupNotify=true
Icon=prboom
Categories=games;
MimeType=application/x-doom;
X-OD-NeedsDownscaling=true
Comment[es]=Motor de Doom para RG350
EOF

# create opk
FLIST="prboom-plus"
FLIST="${FLIST} prboom.gcw0.desktop"
FLIST="${FLIST} prboom.png"
FLIST="${FLIST} prboom-plus-game-server"
FLIST="${FLIST} prboom-launcher"
FLIST="${FLIST} prboom-plus.wad"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat prboom.gcw0.desktop
rm -f prboom.gcw0.desktop
