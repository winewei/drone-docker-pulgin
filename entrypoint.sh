#!/bin/sh
set -ex
# start dockerd
/usr/bin/nohup /usr/local/bin/dockerd > /dev/null 2>&1 &
/bin/sleep 5
# for i in {1..5}
# do 
#     /bin/sleep 1;
# done

# display docker version
/usr/local/bin/docker version

# docker build image
array=`echo $PLUGIN_TAGS | tr ',' ' '`
for tag in $array;
do
    /usr/local/bin/docker build -t $PLUGIN_REPO:$tag .
done

# login docker 
/usr/local/bin/docker login $PLUGIN_REGISTRY -u $PLUGIN_USERNAME --password-stdin $PLUGIN_PASSWORD

# docker push images
for tag in ${array[@]}
do
    /usr/local/bin/docker push $PLUGIN_REPO:$tag
done