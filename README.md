# 7 Days to Die Windows Docker Image

First crack at a Docker image for a 7DTD server.

Slap the [steamcmd.exe](https://developer.valvesoftware.com/wiki/SteamCMD#Windows) in `Game/` and build the image with

```cmd
docker build -t 7dtd .
```

When you run the image, it will automatically place server config files in a volume called `_data`. On Windows, you can usually find this in `%ProgramData%\docker\volumes`.

Recommend running on a transparent network interface and setting a static IP to port forward to. Limiting CPU and memory is also a decent idea just in case something goes haywire.

Example run:

```cmd
docker run --name 7dtd --detach --restart always --cpus 2 --memory 4GB --network=statictlan --hostname 7dtd --ip 192.168.1.6 7dtd
```

## Config stuff

Edit the serverconfig.xml that is placed in the `_data` directory of the volume that's created by the container.

If you'd like to have world and save data put inside the volume as well, edit these parts of the config:

```xml
	<property name="UserDataFolder" value="C:\_data\world" />
	<property name="SaveGameFolder" value="C:\_data\save" />
```