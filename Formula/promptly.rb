class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/2.2.0.tar.gz"
  sha256 "b9eb53e37ed42f557110a1b6c2300d6f85b0025087a34630f5ee898f5966d4e0"
  version "2.2.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
