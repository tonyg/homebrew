require 'formula'

class Sisc < Formula
  url 'http://prdownloads.sourceforge.net/sisc/sisc-1.16.6.tar.gz'
  homepage ''
  md5 '15f2aa0c08b782d7882aa884846b902e'

  def install
    bin.mkpath
    bin.install 'sisc'

    sisclib = lib + 'sisc'
    sisclib.mkpath
    sisclib.install Dir['*.jar']
    sisclib.install Dir['*.shp']
    sisclib.install 'scheme-src'
  end
end
