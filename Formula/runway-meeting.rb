class RunwayMeeting < Formula
  desc "Aviation-themed macOS menu bar app for Google Calendar"
  homepage "https://github.com/mukeshkuiry/runway"
  url "https://github.com/mukeshkuiry/runway/releases/download/v1.0.3/runway-meeting-v1.0.2-darwin-arm64.tar.gz"
  sha256 "d787670f1bfa327b235cefe8a319da070c88b8680e085428d4ff0425de08d9d7"
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
