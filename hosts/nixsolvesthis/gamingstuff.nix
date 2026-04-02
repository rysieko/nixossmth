{
  pkgs,
  inputs,
  ...
}: {
  drivers.mesa-git = {
    enable = true;
    cacheCleanup = {
      # protonPackage is null by default - thus Proton caches are not cleaned by default. Must define a protonPackage to clear Proton / engine caches
      enable = true;
      protonPackage = pkgs.proton-cachyos; # or variation

      mesaCacheDirs = [
        # optional - default lists pre-configured
        "mesa_shader_cache*"
        "radv_builtin_shaders*"
        #etc.
      ];

      protonCacheFiles = [
        # optional - default lists pre-configured
        "vkd3d-proton.cache*"
        "shader*.cache"
        #etc.
      ];

      protonCacheDirs = [
        # optional - default lists pre-configured
        "*ShaderCache*"
        "D3DSCache*"
        #etc.
      ];
    };
    steamOrphanCleanup = {
      enable = true;
      protectedFolders = [
        # folders to not treat as orphans for deletion ( optional, pre-configured with smart defaults )
        "Proton*"
        "Steam Controller Configs"
        #etc.
      ];
    };
  };

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    extraCompatPackages = with pkgs; [
      proton-cachyos
    ];
  };
}
