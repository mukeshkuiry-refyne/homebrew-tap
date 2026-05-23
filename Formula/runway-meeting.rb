class RunwayMeeting < Formula
  desc "Aviation-themed macOS menu bar app for Google Calendar"
  homepage "https://github.com/mukeshkuiry/runway"
  url "https://github.com/mukeshkuiry/runway/releases/download/v1.0.4/runway-meeting-darwin-arm64.tar.gz"
  sha256 "f3fc38789f119bbab394013ce20b0c0841f6d9393b9ace8fee3130ae49ee6fd5"
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
