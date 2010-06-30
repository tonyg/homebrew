require 'formula'

class Autocutsel <Formula
  url 'http://savannah.nongnu.org/download/autocutsel/autocutsel-0.9.0.tar.gz'
  homepage 'http://www.nongnu.org/autocutsel/'
  md5 'ba4a6f632cb4815ae4e5c3027c24cfc5'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
