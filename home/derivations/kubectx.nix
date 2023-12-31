{ stdenv, lib, fetchFromGitHub, kubectl, makeWrapper }:

with lib;

stdenv.mkDerivation rec {
  pname = "kubectx";
  version = "0.9.5";

  src = fetchFromGitHub {
    owner = "ahmetb";
    repo = pname;
    rev = "v${version}";
    sha256 = "1b22jk8zl944w5zn3s7ybkkbmzp9519x32pfqwd1malfly7dzf55";
  };

  buildInputs = [ makeWrapper ];

  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/zsh/site-functions

    cp kubectx $out/bin
    cp kubens $out/bin

    # Provide ZSH completions
    cp completion/kubectx.zsh $out/share/zsh/site-functions/_kubectx
    cp completion/kubens.zsh $out/share/zsh/site-functions/_kubens

    for f in $out/bin/*; do
      wrapProgram $f --prefix PATH : ${makeBinPath [ kubectl ]}
    done
  '';

  meta = {
    description = "Fast way to switch between clusters and namespaces in kubectl!";
    license = licenses.asl20;
    homepage = "https://github.com/ahmetb/kubectx";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}