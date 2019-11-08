IMG="/singularity/images/branson_allen.img"
SIMG="/singularity/images/branson_allen.simg"
DEF="branson_allen.def"
cp ./branson_allen_reqs.txt /tmp/reqs.txt
singularity build -s $IMG $DEF
singularity exec -B /singularity/nvidia:/mnt -w $IMG sh /mnt/cuda_10.0.130_410.48_linux.run -toolkit -silent
singularity exec -B /singularity/nvidia:/mnt -w $IMG tar xvzf /mnt/cudnn-10.0-linux-x64-v7.5.0.56.tgz -C /usr/local
singularity build $SIMG $IMG
