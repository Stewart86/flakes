{
  programs = {
    git = {
      enable = true;
      userName = "stewart86";
      userEmail = "siwei.wong@gmail.com";
      config = {
        init = {
          defaultBranch = "main";
        };
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/github.pub";
        commit.gpgsign = true;
      };
    };
  };
}
