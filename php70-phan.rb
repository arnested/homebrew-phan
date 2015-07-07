require File.expand_path("../../../homebrew/homebrew-php/Abstract/abstract-php-extension", __FILE__)

class Php70Phan < AbstractPhp70Extension
  init
  desc "Static analyzer for PHP"
  homepage "https://github.com/rlerdorf/phan"
  head "https://github.com/rlerdorf/phan.git"

  depends_on "arnested/phan/php70-ast"

  def install
    libexec.install Dir["*"]
    (bin+"phan").write <<-EOS.undent
      #!/bin/sh
      exec "#{Formula["php70"].opt_bin}/php" "#{libexec}/phan" "$@"
    EOS
  end

  def caveats; <<-EOS.undent
    This is a head-only build because the project has no tagged release yet.
    EOS
  end

  test do
    chdir libexec
    system "PATH=#{Formula["php70"].opt_bin}:$PATH #{libexec}/run-tests.php tests/0001_hello_world.phpt | grep -q 'PASS Hello World'"
  end
end
