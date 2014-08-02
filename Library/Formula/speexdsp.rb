require "formula"

class Speexdsp < Formula
  homepage "http://www.speex.org/"
  head "git://git.xiph.org/speexdsp"

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
