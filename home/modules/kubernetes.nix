{pkgs, unstable, system, ... }:
let
  pkgsUnstable = import unstable {inherit system; };
in

{
  home.packages = with pkgs; [
    kubectl
    (callPackage ./../derivations/kubectx.nix { }) # once feature parity is meet use regular kubectx
    k9s
    kubernetes-helm
    kustomize
    minikube
    fluxcd
    argo
    kubent
    kubie
    cmctl
    nodePackages.yaml-language-server
  ] ++ (with pkgsUnstable; [ 
    weave-gitops
  ]);
}