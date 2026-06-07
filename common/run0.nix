{...}: {
  security.sudo.enable = false;
  security.run0 = {
    enableSudoAlias = true;
    wheelNeedsPassword = true;
  };
}
