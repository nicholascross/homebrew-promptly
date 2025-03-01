class Promptly < Formula
  desc "A command-line tool for working with prompts"
  homepage "https://github.com/nicholascross/Promptly"
  url "https://github.com/nicholascross/Promptly/archive/refs/tags/2.1.5.tar.gz"
  sha256 "67158be5be446495ca5e31434cf742519897c8dd739d3e1b2c91af838f693568"
  version "2.1.5"
  depends_on "swift" => :build

  def install
    ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"
    system "swift", "build", "-c", "release"
    bin.install ".build/release/promptly"
  end

  test do
    system "#{bin}/promptly", "--version"
  end
end
