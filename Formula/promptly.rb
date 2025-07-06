class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/4.2.0.tar.gz"
  sha256 "e802f2cb0b78e7ead30be59104630c9695d63e5a4f600987774d132ac00e1116"
  version "4.2.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
