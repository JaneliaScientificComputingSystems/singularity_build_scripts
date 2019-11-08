IMG="/singularity/images/branson_cuda8.img"
SIMG="/singularity/images/branson_cuda8.simg"
DEF="branson_cuda8.def"
singularity build -s $IMG $DEF
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_8.0.61_375.26_linux.run -toolkit -silent
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_8.0.61.2_linux-run --silent --accept-eula
singularity exec -B /singularity/nvidia:/mnt -w $IMG tar xvzf /mnt/cudnn-8.0-linux-x64-v6.0.tgz -C /usr/local
singularity build $SIMG $IMG
