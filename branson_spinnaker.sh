IMG="/singularity/images/branson_spinnaker.img"
SIMG="/singularity/images/branson_spinnaker.simg"
DEF="branson_spinnaker.def"
singularity build -s $IMG $DEF
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_9.0.176_384.81_linux.run -toolkit -silent
singularity exec -B /singularity/nvidia:/mnt -w $IMG tar xvzf /mnt/cudnn-9.0-linux-x64-v7.tgz -C /usr/local
singularity exec -B /singularity/spinnaker-1.13.0.31-amd64:/opt/spinnaker -w $IMG sh /opt/spinnaker/install_spinnaker.sh
singularity build $SIMG $IMG
