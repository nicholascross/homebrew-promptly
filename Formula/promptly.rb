class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/5.1.0.tar.gz"
  sha256 "4753c6d4dfb1bbf14c0a5ebe8cf0a9d7ef1de44397491a5eec89ace01748c2f5"
  version "5.1.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
