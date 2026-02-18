class ClaudeKvmVlm < Formula
  desc "Native VNC daemon with on-device VLM for Claude KVM (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm-native"
  url "https://github.com/ARAS-Workspace/claude-kvm-native/releases/download/vlm-v1.0.0/claude-kvm-vlm-1.0.0-darwin-arm64.tar.gz"
  sha256 "a880a1e4419911e529eb54018f3094d78cf8cdfc051585879408f4a68a94026a"
  version "1.0.0"
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