class Supersummarizeai < Formula
  desc "SuperSummarizeAI - A tool to summarize texts"
  homepage "https://github.com/alexandrevl/SuperSummarizeAI" # Replace with your actual project's URL
  url "https://github.com/alexandrevl/SuperSummarizeAI/archive/refs/tags/v1.0.0.tar.gz" # Replace with the direct link to your tarball or zip
  sha256 "08906c51cd2982d894b99ab1406127d611fff2128461829b6ca3f784518962ab" # Replace with the actual sha256 of your tarball or zip
  license "MIT" # Replace with your license if different

  depends_on "python@3.9" # Ensure Python 3 is installed

  def install
    # Copy the entire project to the prefix
    prefix.install Dir["*"]

    # Create a wrapper script for "ssai" command
    (bin/"ssai").write <<~EOS
      #!/bin/bash
      python3 #{prefix}/ssai.py "$@"
    EOS

    # Install Python dependencies
    system "pip3", "install", "-r", "#{prefix}/requirements.txt"
  end

  test do
    system "#{bin}/ssai", "--help"
  end
end
