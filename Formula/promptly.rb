class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/2.1.4.tar.gz"
  sha256 "d0f401edc56b352a74568037b84b8d437160e42b43bb996c00310665837e351e"
  version "2.1.4"
  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--version"
  end
end
