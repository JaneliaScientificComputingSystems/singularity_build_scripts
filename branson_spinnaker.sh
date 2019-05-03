IMG="/singularity/images/branson_spinnaker.img"
SIMG="/singularity/images/branson_spinnaker.simg"
DEF="branson_spinnaker.def"
singularity build -s $IMG $DEF
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_9.0.176_384.81_linux.run -toolkit -silent
singularity exec -B /singularity/nvidia:/mnt -w $IMG tar xvzf /mnt/cudnn-9.0-linux-x64-v7.tgz -C /usr/local
singularity exec -B /singularity/spinnaker-1.13.0.31-amd64:/opt/spinnaker -w $IMG sh /opt/spinnaker/install_spinnaker.sh
singularity exec -w /singularity/images/branson_spinnaker.img /opt/mntqt/qt-unified-linux-x64-3.1.0-online.run
#sudo -u nielsone10 singularity exec -w $IMG export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && /opt/mntqt/qt-unified-linux-x64-3.1.0-online.run
singularity build $SIMG $IMG
