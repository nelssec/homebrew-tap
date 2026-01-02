class QualysK8s < Formula
  desc "Agentless Kubernetes security scanner for CIS, NSA-CISA, and MITRE compliance"
  homepage "https://github.com/nelssec/qualys-agentless"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-arm64"
      sha256 "17485db99ff333cf41745c8a5545acffa34801022e70bce3f1ff74e6b5b70624"

      def install
        bin.install "qualys-k8s-darwin-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-amd64"
      sha256 "9c3e5ba471e32f74369c430cfeaf876b5790dd5fafc4ae8c513e8c8d5d32fb7d"

      def install
        bin.install "qualys-k8s-darwin-amd64" => "qualys-k8s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-arm64"
      sha256 "682987e304cfec1a416cac70106e65762ee0a3de2a14285efb0480ba614c9d38"

      def install
        bin.install "qualys-k8s-linux-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-amd64"
      sha256 "d67ac7a062a0f354f6eed97a06d89de8e7713c81883d09981d5c236c8d1a8fbb"

      def install
        bin.install "qualys-k8s-linux-amd64" => "qualys-k8s"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qualys-k8s --version")
  end
end
