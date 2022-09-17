class Gyro < Formula
  desc "A Zig package manager with an index, build runner, and build dependencies."
  homepage "https://astrolabe.pm"
  license "MIT"
  depends_on "zig"
  version "0.7.0"

  stable do
    case Hardware::CPU.arch
      when :arm64
        url "https://github.com/mattnite/gyro/releases/download/#{version}/gyro-#{version}-macos-aarch64.tar.gz"
        sha256 "c8fbfb83fdac6df6169f805563daeafb9abaa8446b30c7c6a7bccf15fd1da449"
      when :x86_64
        url "https://github.com/mattnite/gyro/releases/download/#{version}/gyro-#{version}-macos-x86_64.tar.gz"
        sha256 "b50e7c936718eef6aee0830371f368fe20008d0225eb34ad7ad4fb42dbf9e26c"
    end
  end

  livecheck do
    url "https://github.com/mattnite/gyro.git"
    regex /^(\d+\.\d+\.\d+)$/
  end

  head do
    url "https://github.com/mattnite/gyro.git"
  end

  def install
    if head?
      system "zig", "build", "install", "--prefix", prefix
    else
      bin.install "bin/gyro"
    end
  end
end
