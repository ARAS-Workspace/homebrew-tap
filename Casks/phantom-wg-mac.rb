# frozen_string_literal: true

cask "phantom-wg-mac" do
  version "2.1.0"

  on_arm do
    sha256 "8288e9e6220be4a14c671007d6cc167d579bd5b2d409353e100f7871a50a4fba"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "e23215f09bdcc4e6b1eff06ac757536474a52fdaf37a23f4bd4845275e1836e5"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-x86_64.dmg"
  end

  name "Phantom-WG Mac"
  desc "Censorship-resistant WireGuard VPN client with Ghost Mode and Split-Tunneling"
  homepage "https://www.phantom.tc/"

  livecheck do
    url "https://github.com/ARAS-Workspace/phantom-wg/releases.atom"
    regex(/mac-v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :sequoia"

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
