{ stdenv, lib, fetchurl }:

with lib;

stdenv.mkDerivation rec {
  pname = "ec2-instance-selector";
  version = "2.4.1";

  src = fetchurl {
    url = "https://github.com/aws/amazon-ec2-instance-selector/releases/download/v${version}/${pname}-linux-amd64.tar.gz";
    hash = "sha256-mLI6+zh2QOXYtoTkt6KvxQlF8lL+pJuJdwA1mIwUTys=";
  };

  # Work around the "unpacker appears to have produced no directories"
  # case that happens when the archive doesn't have a subdirectory.
  sourceRoot = ".";

  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/bin

    cp ec2-instance-selector $out/bin
  '';

  meta = {
    description = "ec2-instance-selector";
    homepage = "https://github.com/aws/amazon-ec2-instance-selector.git";
    maintainers = with maintainers; [ wcarlsen ];
    platforms = with platforms; unix;
  };
}