class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/4.3.0.tar.gz"
  sha256 "eab820a05a88d430e03f1b37fe62c55f2105541dfea9b6c70768b7a3fc378b40"
  version "4.3.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
