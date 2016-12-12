require File.expand_path("../../language/php", __FILE__)

class Phan < Formula
  include Language::PHP::Composer

  desc "Static analyzer for PHP"
  homepage "https://github.com/etsy/phan"
  url "https://github.com/etsy/phan/archive/0.7.tar.gz"
  sha256 "9217f1ed365bffb40a8d813f691a8e5378ec41564429610ad8ed2a1be1b231c2"
  head "https://github.com/etsy/phan.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "272002f72cb0ccd134a534d6cc849e06ccff009d5f794affe8318427662911c9" => :sierra
    sha256 "ce1cac3f8b542a71da05f94d4115bb3b043c68b2c823a28f4a91b5f432fe6000" => :el_capitan
    sha256 "df9a717231d8aa8133a14caccd75b9480d43d44259e8863dec6e6795ab86a17b" => :yosemite
    sha256 "b5e233ba17c17580ea5d671fe4c45a0aa5af9fbce7078191e9fe8d8e0d58dcb6" => :mavericks
  end

  depends_on "php70-ast"
  depends_on "php70"

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"phan"
  end

  test do
    system "#{bin}/phan", "-h"
  end
end
