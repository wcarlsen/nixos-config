{lib, buildGoModule}:

with lib;

buildGoModule rec {
  pname = "veo-cli";
  version = "0.3.1";

  src = builtins.fetchGit {
    url = "git@github.com:recoord/veo-cli.git";
    rev = "bb7243fd14a29fb7e10d0d9b6cd910ea3105f512";
    ref = "main";
  };

  vendorHash = "sha256-gt6BSQsPdrJgYu43JSgyqbaCa39ApMjEI4d1kmIhM2k=";

  meta = {
    description = "Veo-cli";
    homepage = "https://github.com/recoord/veo-cli";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}
