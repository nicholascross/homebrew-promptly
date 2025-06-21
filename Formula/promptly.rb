class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/3.0.0.tar.gz"
  sha256 "1c82daa4e78a9c19cd6dd2e5ab56e4fabad32563c15040d1f00778696c1f77c8"
  version "3.0.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
