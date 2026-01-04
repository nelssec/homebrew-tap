class Idc < Formula
  desc "Kubernetes Identity & Blast Radius Analyzer - maps RBAC to cloud IAM"
  homepage "https://github.com/nelssec/identity-chain"
  license "Apache-2.0"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-arm64"
      sha256 "9cede06e7b78fbd4d8f41711312789bd1db993ece73de7efd148e0ade26760a5"

      def install
        bin.install "idc-darwin-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-amd64"
      sha256 "21605fa7087f67a28e0e60187fe989d6e32ef97097f411b43190b5525aa50b71"

      def install
        bin.install "idc-darwin-amd64" => "idc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-arm64"
      sha256 "929ad54f3d71ef98c9fcd85d19bf43c9b962d879a05954b42ea772a1f7c02e5b"

      def install
        bin.install "idc-linux-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-amd64"
      sha256 "ae20113bfe8dc077e3f3d04ac1d6c9227e8decd2a47299b0ea14d94efa5de3ce"

      def install
        bin.install "idc-linux-amd64" => "idc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/idc --version")
  end
end
