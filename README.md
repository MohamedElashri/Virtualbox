# Virtualbox
Run virtualbox in a container


## Usage

To deploy my already built image run the following command:

```
 docker run -d \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--privileged \
	--name virtualbox \
	mlashri/virtualbox
```

For the first run it will fail because you will need to recompile the kernel module with: `/etc/init.d/vboxdrv setup`

### How to do that?

copy the files you need for the module from the container that is currently running to your host

1.  lib:
	`docker cp virtualbox:/usr/lib/virtualbox /usr/lib`

2. share    
    `docker cp virtualbox:/usr/share/virtualbox /usr/share` 

3. run the script
    `usr/lib/virtualbox/vboxdrv.sh setup`   

These steps will recompile the kernel module 

4. remove uncessary files 
    `rm -rf /usr/share/virtualbox /usr/lib/virtualbox`


## Credit     
Most of this work is based on [jessfraz's work](https://github.com/jessfraz/dockerfiles)