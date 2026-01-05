class Idc < Formula
  desc "Kubernetes Identity & Blast Radius Analyzer - maps RBAC to cloud IAM"
  homepage "https://github.com/nelssec/identity-chain"
  license "Apache-2.0"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-arm64"
      sha256 "1fb4ce51486a87a77bed1298007ceea3331ecd119f1e35602a0bc9ca071e323b"

      def install
        bin.install "idc-darwin-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-amd64"
      sha256 "af6faf5d6654658c9d2a3b541a64b54278636efcd665abd8a5b68ef3ee45324b"

      def install
        bin.install "idc-darwin-amd64" => "idc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-arm64"
      sha256 "bebe518a004eedf931f3d0563a7bb392bb2bfb1e3660ec31b0fcadf80711d893"

      def install
        bin.install "idc-linux-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-amd64"
      sha256 "8e2e237f89e272e374b7e4242d83fbd5d76b06c62c11aee53d451981ffc24c8d"

      def install
        bin.install "idc-linux-amd64" => "idc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/idc --version")
  end
end
