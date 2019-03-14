log
log "Installing Java JDK 8"
sudo yum -y install java-1.8.0-openjdk-1.8.0*
echo "localhost" > seghostfile
gpssh -e -v -f seghostfile sudo yum -y install java-1.8.0-openjdk-1.8.0*
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")
log "JAVA HOME: $JAVA_HOME"

log "export JAVA_HOME=$JAVA_HOME" >> /home/gpadmin/.bashrc
gpssh -e -v -f seghostfile "export JAVA_HOME=$JAVA_HOME >> /home/gpadmin/.bashrc"
