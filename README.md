# ServerControlPanel
A PowerShell GUI for controlling Minecraft servers hosted on your machine

## Downloading
1. select the dropdown menu in the top left that says 'master'
2. select the latest version (current 2020.0.2)
3. select 'code' in the top right and choose your preferred method of download

### How to use
1. download a copy of the **server** version of the minecraft jar you would like to use (you can find vanilla versions here https://mcversions.net/)
2. Put the jar file in the **ServerFiles** folder
3. choose the recently uploaded jar file by **either** (1.) renaming it to "server.jar" or (2.) opening ServerConfig.txt and changing `Server-Jar-File=server.jar` to match the name of your jar file
4. run the script, select your options, hit apply settings then hit launch


## NOTE: It is reccommended that you update the max RAM bofore running anything but vanilla
to do this open ServerConfig.txt and change `Max-RAM=1G` you can update this number to any number as well as change the G to an M for millibytes **you must have either G (Gigabytes) or M (Millibytes) after the number**

It is recomended to check how much ram your machine has first to do that open task manger via `ctrl + shift + esc` then hit more details and select performance from the list of tabs at the top, then select ram and it will tell you at the top how much ram your pc has.

IF YOU PLAN TO PLAY ON THE MACHINE AND RUN THE SERVER AT THE SAME TIME MAKE SURE YOUR MAX RAM IS NO MORE THAN HALF OF YOUR SYSTEM MEMORY
