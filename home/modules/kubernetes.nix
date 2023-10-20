{pkgs, ... }:

{
  home.packages = with pkgs; [
    kubectl
    (callPackage ./../derivations/kubectx.nix { }) # once feature parity is meet use regular kubectx
    (callPackage ./../derivations/gitops.nix { })
    k9s
    kubernetes-helm
    kustomize
    minikube
    fluxcd
    argo
    kubent
    kubie
    nodePackages.yaml-language-server
  ];
}