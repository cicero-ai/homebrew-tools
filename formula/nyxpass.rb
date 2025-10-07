
class Nyxpass < Formula
  desc "Secure command line utility to manage passwords, authenticator app OTP codes, SSH keys, and notes"
  homepage "https://cicero.sh/nyx"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cicero-ai/nyx/releases/download/v1.0.0/nyx-macos-x86_64.tar.gz"
    sha256 "e90420f037c2f226c054df3d11c8b93f1fd09b786b507e08cf16fb6ecd8a6827"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cicero-ai/nyx/releases/download/v1.0.0/nyx-macos-aarch64.tar.gz"
    sha256 "619fcd4fefb330d7d498740818ed75426172c4a48a49133468beaf8b5a6b7c2c"
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


