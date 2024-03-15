{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodePackages_latest.pnpm
    (pkgs.writeShellApplication {
      name = "serve";
      runtimeInputs = [python312Packages.httpserver];
      text = ''
        python3 -m http.server -d ./result
      '';
    })
  ];
}
