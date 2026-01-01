class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/11.0.3.tar.gz"
  sha256 "d52a2b3bcf89e9d1f615554d488eb7731631b1e3793204728abe2c7589b0ca04"
  version "11.0.3"
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
