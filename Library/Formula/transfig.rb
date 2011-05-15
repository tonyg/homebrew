require 'formula'

class Transfig < Formula
  url 'http://downloads.sourceforge.net/mcj/transfig.3.2.5d.tar.gz'
  version '3.2.5d'
  homepage 'http://www-epb.lbl.gov/xfig/'
  md5 'f9eac7f265668ecbfda6aaf7581989ad'

  depends_on 'imake'

  def install
    system "xmkmf", "-DProjectRoot=#{prefix}", "-DConfigDir=/usr/local/lib/X11/config"
    system "make IMAKE_DEFINES='-DProjectRoot=#{prefix} -DConfigDir=/usr/local/lib/X11/config' Makefiles"
    system "make PNGINC=\"$(pkg-config --cflags libpng)\" PNGLIBS=\"$(pkg-config --libs libpng)\" install"
  end
end
