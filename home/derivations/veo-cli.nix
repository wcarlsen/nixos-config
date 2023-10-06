{lib, buildGoModule}:

with lib;

buildGoModule rec {
  pname = "veo-cli";
  version = "0.2.0";

  src = builtins.fetchGit {
    url = "git@github.com:recoord/veo-cli.git";
    rev = "bb7243fd14a29fb7e10d0d9b6cd910ea3105f512";
    ref = "main";
  };

  # src = fetchFromGitHub {
  #   owner = "recoord";
  #   repo = pname;
  #   rev = "v${version}";
  #   sha256 = "sha256-HsgmbBM02IDjqhBVDvMiXIWqd/nrAKOp+Je7LFhzEJk=";
  # };

  vendorHash = "sha256-Gjw1dRrgM8D3G7v6WIM2+50r4HmTXvx0Xxme2fH9TlQ=";

  meta = {
    description = "Veo-cli";
    homepage = "https://github.com/recoord/veo-cli";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}