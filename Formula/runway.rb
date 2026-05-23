class Runway < Formula
  desc "Aviation-themed macOS menu bar app for Google Calendar"
  homepage "https://github.com/mukeshkuiry/runway"
  url "https://github.com/mukeshkuiry/runway/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bc3b9b3336d0c65ba434ae6d8144e90bc68e29577ffaea791312e2de8d74e4e3"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/Runway" => "runway"
  end

  def post_install
    # The binary self-installs its LaunchAgent on first run,
    # so we just need to launch it once to set everything up.
    # It will start silently in the background on all future logins.
  end

  def caveats
    <<~EOS
      Runway has been installed!

      To start Runway now (it will auto-start on future logins):
        runway

      On first launch, you'll be prompted to connect your Google Calendar.

      To stop Runway:
        launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.mukesh.runway.plist

      To uninstall completely:
        brew uninstall runway
        rm -f ~/Library/LaunchAgents/com.mukesh.runway.plist
        rm -f /tmp/runway.pid
    EOS
  end

  service do
    run opt_bin/"runway"
    keep_alive false
    process_type :background
    log_path var/"log/runway.out.log"
    error_log_path var/"log/runway.err.log"
  end

  test do
    assert_predicate bin/"runway", :executable?
  end
end
