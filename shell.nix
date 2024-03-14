{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodePackages_latest.pnpm
    python312Packages.httpserver
    (pkgs.writeShellApplication {
      name = "serve";
      text = ''
        python3 -m http.server -d ./result/dist/
      '';
    })
  ];
}
