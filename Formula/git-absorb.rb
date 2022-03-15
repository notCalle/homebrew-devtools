class GitAbsorb < Formula
  desc "git commit --fixup, but automatic"
  homepage "https://crates.io/crates/git-absorb"
  license "BSD-3-Clause"
  head "https://github.com/tummychow/git-absorb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (bash_completion/"git-absorb").write `#{bin}/git-absorb --gen-completions bash`
    (fish_completion/"git-absorb.fish").write `#{bin}/git-absorb --gen-completions fish`
    (zsh_completion/"_git-absorb").write `#{bin}/git-absorb --gen-completions zsh`
  end

  test do
    system "cargo", "test"
  end
end
