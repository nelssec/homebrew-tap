class QualysK8s < Formula
  desc "Agentless Kubernetes security scanner for CIS, NSA-CISA, and MITRE compliance"
  homepage "https://github.com/nelssec/qualys-agentless"
  license "Apache-2.0"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-arm64"
      sha256 "cad2958076329a0d9f3be1c0ce4c6318f6edd4da20c45a6d79cb87c68347d511"

      def install
        bin.install "qualys-k8s-darwin-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-amd64"
      sha256 "45e0f465f6db629ea9607d70bd673f2dea21a7900fd3c5c4fc321cd522f5d7b4"

      def install
        bin.install "qualys-k8s-darwin-amd64" => "qualys-k8s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-arm64"
      sha256 "0b8c07c7851faacbf241261b6277aef63299d451dda209a09945b97036691c4b"

      def install
        bin.install "qualys-k8s-linux-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-amd64"
      sha256 "60b830027580fe6163226117eeb38351b773b442e3b078513837bb9952ac1050"

      def install
        bin.install "qualys-k8s-linux-amd64" => "qualys-k8s"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qualys-k8s --version")
  end
end
