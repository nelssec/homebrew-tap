class QualysK8s < Formula
  desc "Agentless Kubernetes security scanner for CIS, NSA-CISA, and MITRE compliance"
  homepage "https://github.com/nelssec/qualys-agentless"
  license "Apache-2.0"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-arm64"
      sha256 "aa4de58b0249b58abe7b3a1e799b3710323a499db13142447adccb6a784ef674"

      def install
        bin.install "qualys-k8s-darwin-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-amd64"
      sha256 "5ffd0c0aa81b1a79100548090abf7c4ab344b496f7e57e55d4a09afb9525e4e5"

      def install
        bin.install "qualys-k8s-darwin-amd64" => "qualys-k8s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-arm64"
      sha256 "cbce004baa927404f2fb42e3be07c5c2f33ca37d3c79bb3c73f2de86b56996f7"

      def install
        bin.install "qualys-k8s-linux-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-amd64"
      sha256 "ad7f7b6a13184e332c7d07fd57963cfc2060058c8209b5ecd12e547e7384d34a"

      def install
        bin.install "qualys-k8s-linux-amd64" => "qualys-k8s"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qualys-k8s --version")
  end
end
