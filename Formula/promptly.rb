class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/4.0.0.tar.gz"
  sha256 "95f39d0c71e308597ce2aa7bc965c97e15d61f999883dbbfc0bfa289c801a5c2"
  version "4.0.0"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--help"
  end
end
