{lib, buildGoModule}:

with lib;

buildGoModule rec {
  pname = "veo-cli";
  version = "0.3.4";

  src = builtins.fetchGit {
    url = "git@github.com:recoord/veo-cli.git";
    rev = "a11f306ce883d1623ddd50ea318002018fad331b";
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
