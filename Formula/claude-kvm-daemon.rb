class ClaudeKvmDaemon < Formula
  desc "Native VNC client daemon for AI-driven desktop control (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/daemon-v1.0.1/claude-kvm-daemon-1.0.1-darwin-arm64.tar.gz"
  sha256 "e0a28a9d272e0383480a379318dea781b371a70ed294ba00bb6ebd3924ecd73f"
  version "1.0.1"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "claude-kvm-daemon"
  end

  def caveats
    <<~EOS
      Start the daemon:
        claude-kvm-daemon --host <vnc-host> --port 5900 --username <user> --password <pass>

      See all options:
        claude-kvm-daemon --help
    EOS
  end
end
