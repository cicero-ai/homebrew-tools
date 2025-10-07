
class Nyxpass < Formula
  desc "Secure command line utility to manage passwords, authenticator app OTP codes, SSH keys, and notes"
  homepage "https://cicero.sh/nyx"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cicero-ai/nyx/releases/download/v1.0.0/nyx-macos-x86_64.tar.gz"
    sha256 "6c30754cd5cc983d2ff60708e259293ae9f04b979b325b1b0d4a437553032346"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cicero-ai/nyx/releases/download/v1.0.0/nyx-macos-aarch64.tar.gz"
    sha256 "857c1ab36d99272618c17e67be2282c73c53b1c1248dd0dfae5680a4412423b3"
  else
    odie "nyx is only available for macOS (Intel or ARM)"
  end

  def install
    bin.install "nyx"
    bin.install_symlink "nyx" => "nyxpass"
  end

  test do
    system "#{bin}/nyx", "--version"
  end
end


