class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/11.0.2.tar.gz"
  sha256 "08b11cb7a1a34bd6024cebaea4db39409511fe978e7a8bc279db5e81c4c21025"
  version "11.0.2"
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
