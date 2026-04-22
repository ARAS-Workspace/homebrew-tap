cask "phantom-wg-mac" do
  version "1.2.1"

  on_arm do
    sha256 "a3f2eb72c9f876cea17c32afaea0c0c2d82e609d187d56ab18c3aaf3a9dd621c"
    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "95bdc0be8cbabd4d5b278883d990cb9e3ed87a96272045c7574c31e224379405"
    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-x86_64.dmg"
  end

  name "Phantom-WG Mac"
  desc "Censorship-resistant WireGuard VPN client with Ghost Mode and Split-Tunneling"
  homepage "https://www.phantom.tc"

  livecheck do
    url "https://github.com/ARAS-Workspace/phantom-wg/releases.atom"
    regex(/mac-v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :sonoma"

  app "Phantom-WG Mac.app"

  uninstall quit: "com.remrearas.Phantom-WG-MacOS"

  zap trash: [
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS",
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS.PhantomTunnel",
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS.PhantomSplitTunnel",
    "~/Library/Group Containers/group.com.remrearas.phantom-wg-macos",
  ]

  caveats <<~EOS
    Phantom-WG Mac ships two System Extensions (PhantomTunnel,
    PhantomSplitTunnel) and installs a VPN configuration on first launch.
    macOS will prompt for approval — follow the on-screen link to
    System Settings.

    Before removing this cask, open the app and use "Remove Extension" in
    Settings for both the tunnel and split-tunnel. Homebrew cannot deactivate
    System Extensions on its own; skipping this step leaves them registered
    until you reinstall the app or reset via `systemextensionsctl`.

    After uninstall, remove the leftover VPN profile from
    System Settings → VPN.
  EOS
end
