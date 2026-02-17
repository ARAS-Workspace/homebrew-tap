class ClaudeKvmVlm < Formula
  desc "On-device VLM inference for Claude KVM (Apple Silicon)"
  homepage "https://github.com/ARAS-Workspace/claude-kvm"
  url "https://github.com/ARAS-Workspace/claude-kvm/releases/download/vlm-v1.0.0/claude-kvm-vlm-1.0.0-darwin-arm64.tar.gz"
  sha256 "d1b291df253e6d0a7267832f3c504a4ef6f26b37860d4635080dc52dc1553859"
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
      First run to download the model:
        claude-kvm-vlm

      Then add to your .mcp.json:
        "CLAUDE_KVM_VLM_TOOL_PATH": "#{opt_bin}/claude-kvm-vlm"
    EOS
  end
end