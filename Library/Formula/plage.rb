require 'formula'

class Plage <Formula
  url 'http://voxel.dl.sourceforge.net/project/plage/plage/1.1.3/plage-1.1.3.tgz'
  homepage 'http://plage.sourceforge.net/'
  md5 '7bbfc23d2d158f85cbb8a5c117f04947'

  def install
    ENV.no_optimization
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
