require 'formula'

class Xfig < Formula
  homepage 'http://xfig.org/'
  url 'http://downloads.sourceforge.net/mcj/xfig.3.2.5b.full.tar.gz'
  sha1 '0730d7e6bc217c0de02682efb0078821512bb542'
  version '3.2.5b'

  depends_on :x11
  depends_on "xaw3d"

  def patches
    DATA
  end

  def install
    system "chmod -R a+rwX ."

    inreplace 'Imakefile', "XPMLIBDIR = /usr/local/lib", "XPMLIBDIR = /usr/X11/lib"
    inreplace 'Imakefile', "XFIGDOCDIR = /usr/local/xfig/doc", "XFIGDOCDIR = #{doc}"
    inreplace 'Imakefile', 'MANDIR = $(MANSOURCEPATH)$(MANSUFFIX)', "MANDIR = #{man}"
    inreplace 'Imakefile', "XCOMM BINDIR = /usr/bin", "BINDIR = #{bin}\nLIBDIR = #{lib}\nCONFDIR = #{prefix}/etc"
    inreplace 'Imakefile', "XCOMM XAPPLOADDIR = /home/user/xfig", "XAPPLOADDIR = #{lib}/app-defaults"

    inreplace 'Imakefile', /^\s+#/, "#"

    system "xmkmf"
    system "make"
    system "make install.all"
  end
end

__END__
diff --git a/fig.h b/fig.h
--- a/fig.h
+++ b/fig.h
@@ -374,6 +374,9 @@
 extern long            random();
 extern void            srandom(unsigned int);
 
+#elif defined(__APPLE__)
+/* no need to define srandom */
+
 #elif !defined(__osf__) && !defined(__CYGWIN__) && !defined(linux) && !defined(__FreeBSD__) && !defined(__GLIBC__)
 extern void            srandom(int);

diff --git a/w_keyboard.c b/w_keyboard.c
--- a/w_keyboard.c
+++ b/w_keyboard.c
@@ -41,7 +41,7 @@
 #define REG_NOERROR REG_OKAY
 #endif
 
-#if defined(__FreeBSD__) && !defined(REG_NOERROR)
+#if (defined(__FreeBSD__) || defined(__APPLE__)) && !defined(REG_NOERROR)
 #define REG_NOERROR 0
 #endif
