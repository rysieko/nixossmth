{...}: {
  security.sudo.enable = false;
  security.run0 = {
    enable = true;
    enableSudoAlias = true;
    wheelNeedsPassword = true;
  };
}
