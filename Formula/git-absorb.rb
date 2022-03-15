class GitAbsorb < Formula
  desc "git commit --fixup, but automatic"
  homepage "https://crates.io/crates/git-absorb"
  license "BSD-3-Clause"
  head "https://github.com/tummychow/git-absorb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "cargo", "test"
  end
end
