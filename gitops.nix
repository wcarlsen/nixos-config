{ stdenv, lib, fetchurl, installShellFiles }:

with lib;

stdenv.mkDerivation rec {
  pname = "gitops";
  version = "0.30.0";

  src = fetchurl {
    url = "https://github.com/weaveworks/weave-gitops/releases/download/v${version}/gitops-linux-x86_64.tar.gz";
    sha256 = "sha256-akIOQXuTzOpZ7T3JIOlA/Vy/WkIJ5BI5wWgGlvB6q2A=";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp gitops $out/bin

    # $out/bin/gitops set config analytics false
    # $out/bin/gitops completion zsh > gitops.zsh
    # installShellCompletion gitops.zsh
  '';

  meta = {
    description = "Weave GitOps OSS";
    license = licenses.mpl20;
    homepage = "https://github.com/weaveworks/weave-gitops";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}