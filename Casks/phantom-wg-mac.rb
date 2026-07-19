# frozen_string_literal: true

cask "phantom-wg-mac" do
  version "1.3.1"

  on_arm do
    sha256 "c7475a429cdd59796d23c43218bdd3678a4b32d37a9ea6891f6ebad6480f3c67"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f5ef36aa1c7fe6462fcfa61fc460d97009cd9f557cee74bfea1770dc845414da"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-x86_64.dmg"
  end

  name "Phantom-WG Mac"
  desc "Censorship-resistant WireGuard VPN client with Ghost Mode and Split-Tunneling"
  homepage "https://www.phantom.tc/"

  livecheck do
    url "https://github.com/ARAS-Workspace/phantom-wg/releases.atom"
    regex(/mac-v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :sonoma

  app "Phantom-WG Mac.app"

  uninstall quit: "com.remrearas.Phantom-WG-MacOS"

  zap trash: [
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS",
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS.PhantomDNSProxy",
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS.PhantomSplitTunnel",
    "~/Library/Containers/com.remrearas.Phantom-WG-MacOS.PhantomTunnel",
    "~/Library/Group Containers/group.com.remrearas.phantom-wg-macos",
  ]

  caveats <<~EOS
    Phantom-WG Mac ships three System Extensions (PhantomTunnel,
    PhantomSplitTunnel, PhantomDNSProxy) and installs a VPN configuration
    on first launch. macOS will prompt for approval — follow the on-screen
    link to System Settings for each extension.

    Before removing this cask, open the app and use the "Uninstall System
    Extensions" action from the settings gear menu; it deactivates all
    three extensions in a single step. Homebrew cannot deactivate System
    Extensions on its own; skipping this step leaves them registered until
    you reinstall the app or reset via `systemextensionsctl`.

    After uninstall, remove the leftover VPN profile from
    System Settings → VPN.
  EOS
end
