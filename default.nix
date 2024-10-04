{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "salesforcecli";
  version = "latest";

  src = fetchurl {
    url = "https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz";
    sha256 = "sha256-2rxjxM2a+39WxzC/KCU9TYrDbQMr2Iwnjjawxq15Xfo="; 
  };

  nativeBuildInputs = [ stdenv.cc ];

  installPhase = ''
    mkdir -p $out/bin
    tar xJf $src --strip-components 1 -C $out
    chmod +x $out/bin/sf
  '';

  meta = with lib; {
    description = "Salesforce CLI";
    homepage = "https://developer.salesforce.com/tools/sfdxcli";
    license = licenses.gpl3;
    maintainers = with maintainers; [ "bridleiva" ];
  };
}
