{config, pkgs, ...}:

{
 services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true; 
    declarative = true;
    whitelist = {
        rysieko = "3417b490-fe2c-4f78-98e1-a697a99be16d"
    };
    serverProperties = {
        server-port = 25526;
        difficulty = 3;
        gamemode = 0;
        max-players = 20;
        force-gamemode = true;
        level-seed = "123asddq2q231231231adsd";
        motd = "Im John. John Minecraft";
        white-list = true;
        allow-cheats = false;
    };
    jvmOpts = "-Xms2048M -Xmx2048M"; 
 };
}