class ClaudeKvmVlm < Formula
  desc "Native VNC daemon with on-device VLM for Claude KVM (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/vlm-v2.0.0/claude-kvm-vlm-2.0.0-darwin-arm64.tar.gz"
  sha256 "77827aba6a132af7c47341ba19a8d9352c90a7cf4174290535c559c8c3f6cddc"
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
