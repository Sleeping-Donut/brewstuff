cask "videomass" do
  version "5.0.20"
  sha256 "61d09b81b47d88cd39bb456b4e1a3dd8e21f2fb63658236661f1de64093dbb9e"
  url "https://files.pythonhosted.org/packages/source/v/videomass/videomass-#{version}.tar.gz"
  name "Videomass"
  desc "A Python GUI for FFmpeg"
  homepage "https://pypi.org/project/videomass/"

  # The `python` command is used to install the package
  depends_on formula: "python"

  # Installation steps
  installer script: {
    executable: "python3",
    args: ["-m", "pip", "install", "--no-deps", "--ignore-installed", "--prefix=#{staged_path}", "#{url}"],
  }

  # Specify how to link the application
  binary "#{staged_path}/bin/videomass", target: "#{bin}/videomass"

  # Define the app's location
  caveats <<~EOS
    To use Videomass, you may need to ensure that #{bin} is in your PATH.
  EOS

  # Define uninstall instructions
  uninstall delete: "#{staged_path}/bin/videomass"

  # Optional: add zap command if there are files to remove on uninstallation
  zap trash: [
    "~/Library/Application Support/videomass",
  ]
end

