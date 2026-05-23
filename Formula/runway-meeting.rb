class RunwayMeeting < Formula
  desc "Aviation-themed macOS menu bar app for Google Calendar"
  homepage "https://github.com/mukeshkuiry/runway"
  url "https://github.com/mukeshkuiry/runway/releases/download/v1.0.2/runway-meeting-v1.0.1-darwin-arm64.tar.gz"
  sha256 "2fb9b14d78e6b3a0b6357eb05de8c03200ea5901e0186a48e5dd40ada7566bf3"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "Runway" => "runway-meeting"
  end

  def caveats
    <<~EOS
      Runway Meeting has been installed!

      To start (runs in background, auto-starts on login):
        runway-meeting start

      To stop (and disable auto-start):
        runway-meeting stop

      To check status:
        runway-meeting status
    EOS
  end

  test do
    assert_predicate bin/"runway-meeting", :executable?
  end
end
