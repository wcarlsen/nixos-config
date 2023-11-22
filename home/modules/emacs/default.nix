{ pkgs, unstable, system, emacs-overlay, org-babel, ...}:
let
  pkgsEmacs = import unstable { inherit system; overlays = [ (import emacs-overlay )]; };
  tangle = org-babel.lib.tangleOrgBabel {
    languages = [ "emacs-lisp" ];
  };
in {
  home.packages = with pkgsEmacs; [
    (emacsWithPackagesFromUsePackage {
      package = pkgs.emacs;
      alwaysEnsure = true;
      alwaysTangle = true;
      config = ./init.org;
      defaultInitFile = false;
    })
  ];

  home.file.".emacs.d/init.el".text = tangle (builtins.readFile ./init.org);
}
