class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/5.1.1.tar.gz"
  sha256 "7c2e72ff8815ff5757242dcaeb2225cc15e24d34977f0ac0f20bd9fae7f9334d"
  version "5.1.1"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
