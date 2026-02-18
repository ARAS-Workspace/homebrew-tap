class ClaudeKvmVlm < Formula
  desc "Native VNC daemon with on-device VLM for Claude KVM (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/vlm-v2.0.0/claude-kvm-vlm-2.0.0-darwin-arm64.tar.gz"
  sha256 "7a4e04abba19959416e5c22e51fb468cfd6b49337e75a1a264269ef10b4fba0e"
  version "2.0.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install "claude-kvm-vlm", "mlx.metallib"
    bin.install_symlink libexec/"claude-kvm-vlm"
  end

  def caveats
    <<~EOS
      Download the VLM model:
        claude-kvm-vlm --download-model

      Start the daemon:
        claude-kvm-vlm --host <vnc-host> --port 5900 --username <user> --password <pass>
    EOS
  end
end
