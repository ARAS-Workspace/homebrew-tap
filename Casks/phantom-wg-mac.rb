# frozen_string_literal: true

cask "phantom-wg-mac" do
  version "2.1.2"

  on_arm do
    sha256 "e24e4f9109dc4b1b83e1a3485100b93cb55f7d5c37468ac60b750a31b8167c61"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "c9fe6dfc625f8328284172d2c47031d451e74e1dd09c581533248f743450eb7d"

    url "https://github.com/ARAS-Workspace/phantom-wg/releases/download/mac-v#{version}/Phantom-WG-MacOS-#{version}-x86_64.dmg"
  end

  name "Phantom-WG Mac"
  desc "Censorship-resistant WireGuard VPN client with Ghost Mode and Split-Tunneling"
  homepage "https://www.phantom.tc/"

  livecheck do
    url "https://github.com/ARAS-Workspace/phantom-wg/releases.atom"
    regex(/mac-v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :sequoia

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

    That step also removes this user's VPN entries. Entries it could
    not claim as ours are left in place, as is every entry if you skip
    it — so check System Settings → VPN once the app is gone.
  EOS
end
