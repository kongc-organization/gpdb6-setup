source ${MY_DIR}/scripts/common/redhat7.sh
sudo rpm -ivh $RPM

log "Updating /etc/sysctl.conf"
cp /etc/sysctl.conf ./backup-sysctl.conf
cp files/gpdb-sysctl.conf /etc/sysctl.conf
sysctl -p /etc/sysctl


log "Updating /etc/security/limits.conf"
cp /security/limits.conf ./backup-limits.conf
cp files/gpdb-limits.conf /etc/security/limits.conf



chown -R gpadmin:gpadmin /usr/local/greenplum-db/
mkdir -p /data/master
mkdir /data/primary
chown -R gpadmin:gpadmin /data
su - gpadmin
echo "source /usr/local/greenplum-db/greenplum_path.sh" >> .bashrc
echo "export MASTER_DATA_DIRECTORY=/data/master/gpseg-1" >> .bashrc
source .bashrc
HOSTNAME=`hostname`
echo $HOSTNAME > hostfile
gpssh-exkeys -f hostfile