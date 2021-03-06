{ stdenv, fetchzip }:

let
  version = "5.1.0";
in fetchzip rec {
  name = "font-awesome-${version}";

  url = "https://github.com/FortAwesome/Font-Awesome/archive/${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Brands-Regular-400.otf" -d $out/share/fonts/opentype
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Free-Regular-400.otf" -d $out/share/fonts/opentype
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Free-Solid-900.otf" -d $out/share/fonts/opentype
  '';

  sha256 = "12m35bk61d8pddhybg2jpl5xv16dclz1qacdmk05m11nzshd3nz1";

  meta = with stdenv.lib; {
    description = "Font Awesome - OTF font";
    longDescription = ''
      Font Awesome gives you scalable vector icons that can instantly be customized.
      This package includes only the OTF font. For full CSS etc. see the project website.
    '';
    homepage = http://fortawesome.github.io/Font-Awesome/;
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ abaldeau ];
  };
}
