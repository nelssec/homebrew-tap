class Idc < Formula
  desc "Kubernetes Identity & Blast Radius Analyzer - maps RBAC to cloud IAM"
  homepage "https://github.com/nelssec/identity-chain"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-arm64"
      sha256 "3a8abed9636dcd00bd2a840f1cb0d7d06aa9ae6fd1d9b897a3e9ad5de4525a3d"

      def install
        bin.install "idc-darwin-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-darwin-amd64"
      sha256 "06a87be3c5cac2d97bb9eecc69203826a2efcceedf43c423900f4f740c933583"

      def install
        bin.install "idc-darwin-amd64" => "idc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-arm64"
      sha256 "95ecedf67dbed873563e975b219456d6fcfa07a6a2b32ab384809d8845a50c0f"

      def install
        bin.install "idc-linux-arm64" => "idc"
      end
    else
      url "https://github.com/nelssec/identity-chain/releases/download/v#{version}/idc-linux-amd64"
      sha256 "4d135b5e49243a85d603f2d6f21fab60642cd6bf422513fcd9ea52f8044f08de"

      def install
        bin.install "idc-linux-amd64" => "idc"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/idc --version")
  end
end
