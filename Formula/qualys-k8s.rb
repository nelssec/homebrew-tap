class QualysK8s < Formula
  desc "Agentless Kubernetes security scanner for CIS, NSA-CISA, and MITRE compliance"
  homepage "https://github.com/nelssec/qualys-agentless"
  license "Apache-2.0"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-arm64"
      sha256 "bda57bedca0bfef2421da51582c7d6256e542fbcc8002379640b69549feb8296"

      def install
        bin.install "qualys-k8s-darwin-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-darwin-amd64"
      sha256 "a197ea23f6b9a02a26a9b3df40a93460b80b19495b6b49d3ba89964549f1c39d"

      def install
        bin.install "qualys-k8s-darwin-amd64" => "qualys-k8s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-arm64"
      sha256 "35d614ab40bddfd990d8226e25f3fee7f62a19a6a5337c1a00e8e7f67401543a"

      def install
        bin.install "qualys-k8s-linux-arm64" => "qualys-k8s"
      end
    else
      url "https://github.com/nelssec/qualys-agentless/releases/download/v#{version}/qualys-k8s-linux-amd64"
      sha256 "cbfb01034c7c85b1937a78d16f57d16ca919082a161fb3dfadf74c0fd6b69107"

      def install
        bin.install "qualys-k8s-linux-amd64" => "qualys-k8s"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qualys-k8s --version")
  end
end
