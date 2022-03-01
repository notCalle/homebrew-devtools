class Gyro < Formula
  desc "A Zig package manager with an index, build runner, and build dependencies."
  homepage "https://astrolabe.pm"
  license "MIT"
  depends_on "zig"
  version "0.5.0"

  stable do
    case Hardware::CPU.arch
      when :arm64
        url "https://github.com/mattnite/gyro/releases/download/#{version}/gyro-#{version}-macos-aarch64.tar.gz"
        sha256 "878a60a9385afb6c9f24d4048007acb382f09d69c375d39bc1cb43d75f1c1797"
      when :x86_64
        url "https://github.com/mattnite/gyro/releases/download/#{version}/gyro-#{version}-macos-x86_64.tar.gz"
        sha256 "d2604fdb5ad810917532d58a563e39eef1adba5fcd996268e0f90404dab62849"
    end
  end

  head do
    url "https://github.com/mattnite/gyro.git"
  end

  def install
    if head?
      system "zig build install --prefix #{prefix}"
    else
      bin.install "bin/gyro"
    end
  end
end
