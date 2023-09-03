class Ssai < Formula
  desc "SuperSummarizeAI - A tool to summarize texts"
  homepage "https://github.com/alexandrevl/SuperSummarizeAI" 
  url "https://github.com/alexandrevl/SuperSummarizeAI/archive/v1.0.0.tar.gz" 
  sha256 "08906c51cd2982d894b99ab1406127d611fff2128461829b6ca3f784518962ab"
  license "MIT"

  depends_on "python@3.9"

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

  def post_install
    ohai "IMPORTANT!"
    opoo "Before using SuperSummarizeAI, you need to set your OPENAI_KEY."
    opoo "Run the following command, replacing 'YOUR_OPENAI_KEY' with your actual key:"
    puts "ssai --OPENAI_KEY=YOUR_OPENAI_KEY"
  end

  test do
    system "#{bin}/ssai", "--help"
  end
end
