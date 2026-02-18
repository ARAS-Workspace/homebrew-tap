class ClaudeKvmDaemon < Formula
  desc "Native VNC operator daemon for Claude KVM (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/daemon-v2.0.0/claude-kvm-daemon-2.0.0-darwin-arm64.tar.gz"
  sha256 "547e2faa3137daa87fd0c35a80bbfdf56131867243dcf5108c681f2b6e37ba32"
  version "2.0.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install "claude-kvm-daemon", "mlx.metallib"
    bin.install_symlink libexec/"claude-kvm-daemon"
  end

  def caveats
    <<~EOS
      Download the VLM model:
        claude-kvm-daemon --download-model

      Start the daemon:
        claude-kvm-daemon --host <vnc-host> --port 5900 --username <user> --password <pass>
    EOS
  end
end
