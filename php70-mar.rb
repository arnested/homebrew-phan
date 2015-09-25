require File.expand_path("../../../homebrew/homebrew-php/Abstract/abstract-php-extension", __FILE__)

class Php70Mar < AbstractPhp70Extension
  init
  desc "PHP 7 Migration Assistant Report (MAR)"
  homepage "https://github.com/Alexia/php7mar"
  head "https://github.com/Alexia/php7mar.git"

  depends_on "php70"

  def install
    libexec.install Dir["*"]
    (bin+"mar").write <<-EOS.undent
      #!/bin/sh
      exec "#{Formula["php70"].opt_bin}/php" "#{libexec}/mar.php" "$@"
    EOS
  end

  def caveats; <<-EOS.undent
    This is a head-only build because the project is still in active development.
    EOS
  end

  test do
    chdir libexec
    system "PATH=#{Formula["php70"].opt_bin}:$PATH php #{libexec}/mar.php -f=#{libexec}/testcases.php"
  end
end
