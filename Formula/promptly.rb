class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/7.1.8.tar.gz"
  sha256 "34ee41e72e305461c2a0f65e66e21fca57d24e749cd7db0a0b45572152d7b10f"
  version "7.1.8"
  depends_on "swift" => :build

  def install
    # inject version placeholder replacement into source
    inreplace "Sources/Promptly/Promptly.swift", "__VERSION__", version.to_s
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
