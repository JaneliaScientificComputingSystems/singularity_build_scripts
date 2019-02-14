IMG="/singularity/images/branson_v2.img"
SIMG="/singularity/images/branson_v2.simg"
DEF="branson_v2.def"
singularity build -s $IMG $DEF
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_9.0.176_384.81_linux.run -toolkit -silent
singularity exec -B /singularity/nvidia:/mnt -w $IMG tar xvzf /mnt/cudnn-9.0-linux-x64-v7.tgz -C /usr/local
singularity build $SIMG $IMG
