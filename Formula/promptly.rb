class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/12.0.0.tar.gz"
  sha256 "4d9813fe27441c250b7e49b709c3463a46f2357fa59cb5874aa931138f494ea4"
  version "12.0.0"
  depends_on "swift" => :build

  def install
    # inject version placeholder replacement into source
    inreplace "Sources/Promptly/Promptly.swift", "__VERSION__", version.to_s
    system "swift", "build", "-c", "release", "--disable-sandbox"
    libexec.install ".build/release/promptly"
    libexec.install ".build/release/Promptly_PromptlyAssets.bundle"
    bin.install_symlink libexec/"promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
