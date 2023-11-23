{lib, buildGoModule}:

with lib;

buildGoModule rec {
  pname = "veo-cli";
  version = "0.3.4";

  src = builtins.fetchGit {
    url = "git@github.com:recoord/veo-cli.git";
    rev = "07f7b65071f9a41762d4334701d0eea198ae017b";
    ref = "main";
  };

  vendorHash = "sha256-kfgjMJMsKYxZukKcfD7xYCmJ2/irwdbVnInAurSUXvQ";

  meta = {
    description = "Veo-cli";
    homepage = "https://github.com/recoord/veo-cli";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}
