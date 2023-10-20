final: prev:
{
  granted = prev.granted.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "common-fate";
      repo = "granted";
      rev = "v1.19.1";
      sha256 = "sha256-BvrMfQ/fiAMJCROwOqzt17ae/qqDC2KFdBK2epVImus=";
    };
  });
}