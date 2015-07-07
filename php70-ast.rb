require File.expand_path("../../../homebrew/homebrew-php/Abstract/abstract-php-extension", __FILE__)

class Php70Ast < AbstractPhp70Extension
  init
  desc "Extension exposing PHP 7 abstract syntax tree"
  homepage "https://github.com/nikic/php-ast"
  head "https://github.com/nikic/php-ast.git"

  depends_on "homebrew/php/php70"

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--disable-dependency-tracking"
    system "make"
    prefix.install "modules/ast.so"
    write_config_file if build.with? "config-file"
  end

  def caveats; <<-EOS.undent
    This is a head-only build because the project has no tagged release yet.
    EOS
  end

  test do
    assert_match /^ast$/, shell_output("php -m")
  end
end
