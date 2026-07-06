class ClaudeKvmDaemon < Formula
  desc "Native VNC client daemon for AI-driven desktop control (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/daemon-v1.0.2/claude-kvm-daemon-1.0.2-darwin-arm64.tar.gz"
  sha256 "623c8dac8cf4bef515be108abedd9f9aeb4ee286a5bac2c77a339f7a41741674"
  version "1.0.2"
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
