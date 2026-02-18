class ClaudeKvmDaemon < Formula
  desc "Native VNC client daemon for AI-driven desktop control (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/daemon-v1.0.0/claude-kvm-daemon-1.0.0-darwin-arm64.tar.gz"
  sha256 "14a0af5083b454a6fae7dc148e5b2273c001f4a10d8dc67c40187a87d60ccc80"
  version "1.0.0"
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
