class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/11.0.1.tar.gz"
  sha256 "10a8aa9fcaa9759919c7e68f6d128201ee5eda913c96fe897f60e97933906a72"
  version "11.0.1"
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
