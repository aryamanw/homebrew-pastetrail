class Pastetrail < Formula
  desc "macOS menu bar clipboard manager — 20-clip history via ⌘⇧V"
  homepage "https://github.com/aryamanw/PasteTrail"
  url "https://github.com/aryamanw/PasteTrail/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "adb08a4d5f4170380bd80abfd9ae34618b688e898a36a8fc79ee51252b77b137"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos => :ventura

  def install
    system "xcodebuild",
           "-scheme", "PasteTrail",
           "-configuration", "Release",
           "-derivedDataPath", "build",
           "ONLY_ACTIVE_ARCH=NO",
           "CODE_SIGN_IDENTITY=",
           "CODE_SIGNING_REQUIRED=NO",
           "CODE_SIGNING_ALLOWED=NO"
    app = Dir["build/Build/Products/Release/PasteTrail.app"].first
    raise "Build output not found" unless app
    prefix.install app
  end

  def caveats
    <<~EOS
      PasteTrail.app was installed to:
        #{prefix}/PasteTrail.app

      To use it, move it to your Applications folder:
        cp -r #{prefix}/PasteTrail.app /Applications/

      On first launch, grant Accessibility access in:
        System Settings → Privacy & Security → Accessibility
    EOS
  end

  test do
    assert_predicate prefix/"PasteTrail.app", :exist?
  end
end
