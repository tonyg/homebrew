require 'formula'

class Fetchmail <Formula
  url 'http://download.berlios.de/fetchmail/fetchmail-6.3.15.tar.bz2'
  homepage ''
  md5 ''

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
