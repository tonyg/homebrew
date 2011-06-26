require 'formula'

class Mpage < Formula
  url 'http://www.mesa.nl/pub/mpage/mpage-2.5.6.tgz'
  homepage 'http://www.mesa.nl/pub/mpage/'
  md5 '489663c9246e47915cea931348e5175d'

  def install
    system "make PREFIX=#{prefix} MANDIR=#{man}"
    system "make PREFIX=#{prefix} MANDIR=#{man} install"
  end
end
