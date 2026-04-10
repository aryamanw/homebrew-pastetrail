class Pastetrail < Formula
  desc "macOS menu bar clipboard manager — 20-clip history via ⌘⇧V"
  homepage "https://github.com/aryamanw/PasteTrail"
  url "https://github.com/aryamanw/PasteTrail/releases/download/v0.1.1/PasteTrail.zip"
  sha256 "b03b0ede3597fe4d7c719dcb4298ba59064d8347e7f486f06975ee324dc788de"
  license "MIT"

  depends_on :macos => :ventura

  def install
    prefix.install "PasteTrail.app"
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
