class QualysK8s < Formula
  desc "Agentless Kubernetes security scanner for CIS, NSA-CISA, and MITRE compliance"
  homepage "https://github.com/nelssec/qualys-agentless"
  license "Apache-2.0"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-arm64"
      sha256 "783b0d783d34456c33e98919cd158ed42962b9bfdb74e15181dd9568038601a6"

      def install
        bin.install "qualys-k8s-darwin-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-amd64"
      sha256 "7d9c9d216377b686cd1cb122078ce4fad5ed0a457093eeec2e87371a5d203291"

      def install
        bin.install "qualys-k8s-darwin-amd64" => "qualys-k8s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-arm64"
      sha256 "710c4a97f6c792a732bdf359df3eb85d9ef0873e2d10335b00d185c550724179"

      def install
        bin.install "qualys-k8s-linux-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-amd64"
      sha256 "9b80e8c9e8b028a282952306ea73e56193a584fb4c9b6f024f051f7a809e8f14"

      def install
        bin.install "qualys-k8s-linux-amd64" => "qualys-k8s"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qualys-k8s --version")
  end
end
