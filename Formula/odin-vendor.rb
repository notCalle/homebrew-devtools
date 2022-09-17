class OdinVendor < Formula
  desc "The missing vendor packages for Odin"
  homepage "https://pkg.odin-lang.org/vendor/"
  url "https://github.com/odin-lang/Odin.git",
      tag:      "dev-2022-09",
      revision: "74458ab09676d3b66364f8c4679afb53fcf1b4f7"
  version "2022-09"
  license "BSD-3-Clause"
  head "https://github.com/odin-lang/Odin.git", branch: "master"

  depends_on "odin"
  link_overwrite "bin/odin"

  fails_with gcc: "5" # LLVM is built with GCC

  def odin
    Formula["odin"]
  end

  def install
    Dir[odin.opt_libexec/"*/"].each do |path|
      libexec.install_symlink path
    end
    libexec.install "vendor"
    (bin/"odin").write <<~EOS
      #!/bin/bash
      export PATH="#{Formula["llvm"].opt_bin}:$PATH"
      export ODIN_ROOT="#{opt_libexec}"
      exec -a odin "#{odin.opt_libexec}/odin" "$@"
    EOS
  end

  test do
    system "#{bin}/odin", "check", "#{odin.pkgshare}/examples/all"
  end
end
