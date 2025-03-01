class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/2.1.6.tar.gz"
  sha256 "025e7c2eef010046b3be9f7b99ca15700f7f10ad5eb62f8696ce5651677ed1af"
  version "2.1.6"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--version"
  end
end
