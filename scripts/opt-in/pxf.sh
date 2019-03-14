echo
echo "Run the pxf cluster init command to initialize the PXF service on the master"
mkdir -p /home/gpadmin/pxf
PXF_CONF=/home/gpadmin/usercfg $GPHOME/pxf/bin/pxf cluster init