class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/7.1.1.tar.gz"
  sha256 "d86589a0b07db9d10b3967283a9278de75c19dc46470255b5e75cf0ab5cb2cc8"
  version "7.1.1"
  depends_on "swift" => :build

  def install
    # inject version placeholder replacement into source
    inreplace "Sources/Promptly/Promptly.swift", "__VERSION__", version
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
