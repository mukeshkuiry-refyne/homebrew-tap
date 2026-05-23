class RunwayMeeting < Formula
  desc "Aviation-themed macOS menu bar app for Google Calendar"
  homepage "https://github.com/mukeshkuiry/runway"
  url "https://github.com/mukeshkuiry/runway/releases/download/v1.0.0/runway-meeting-v1.0.0-darwin-arm64.tar.gz"
  sha256 "87ba3f8ed2585ea74270ee993da6eefecd1b8bd055c893bb912292e591fc6f40"
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
