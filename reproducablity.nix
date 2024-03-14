{
  jq,
  lib,
  stdenv,
  cacert,
  moreutils,
  stdenvNoCC,
  nodePackages,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "reproducibility";
  version = "0.1.0";

  src = ./reproducibility;

  pnpmDeps = stdenvNoCC.mkDerivation {
    inherit (finalAttrs) src version;

    pname = "${finalAttrs.pname}-pnpm-deps";

    dontFixup = true;
    dontBuild = true;

    nativeBuildInputs = [cacert jq moreutils nodePackages.pnpm];

    installPhase = ''
      export HOME=$(mktemp -d)

      pnpm config set store-dir $out
      pnpm install --frozen-lockfile --ignore-script

      rm -rf $out/v3/tmp
      for f in $(find $out -name "*.json"); do
        sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
        jq --sort-keys . $f | sponge $f
      done
    '';

    outputHashMode = "recursive";
    outputHash = "sha256-e1skamKQwrKNK+6Ryl7eBSPyfBnbY2WHC3+xsMwvPRM=";
  };

  nativeBuildInputs = [nodePackages.pnpm];

  preBuild = ''
    export HOME=$(mktemp -d)
    export STORE_PATH=$(mktemp -d)

    cp -Tr "$pnpmDeps" "$STORE_PATH"
    chmod -R +w "$STORE_PATH"

    pnpm config set store-dir "$STORE_PATH"
    pnpm install --offline --frozen-lockfile --ignore-script
    patchShebangs node_modules/{*,.*}
  '';

  postBuild = ''
    pnpm build
  '';

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';

  passthru = {
    inherit (finalAttrs) pnpmDeps;
  };

  meta = {
    description = "Slides for a talk about reproducability in software development";
    homepage = "https://isabelroses.com/talks";
    license = lib.licenses.cc-by-40;
    maintainers = with lib.maintainers; [isabelroses];
    platforms = lib.platforms.all;
  };
})
