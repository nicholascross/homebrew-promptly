class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/12.1.1.tar.gz"
  sha256 "f44247a484c71831cfb6803fba765c32ccfbf87fd9f57e6c0c70eb473290999b"
  version "12.1.1"
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
