# frozen_string_literal: true

class Credz < Formula
  desc 'AWS Okta Assume Role CLI'
  homepage 'https://github.com/ryangraham/credz'
  url 'https://github.com/ryangraham/credz/archive/v0.0.1-2241c74.tar.gz'
  sha256 'd8651106fd60701f451ccb9cb458a66d99ee3594e4c5da675ec0d73325db4bba'
  head 'https://github.com/ryangraham/credz.git', branch: 'master'
  version '0.0.1-2241c74'

  depends_on 'cmake'
  depends_on 'boost'
  depends_on 'aws-sdk-cpp'
  depends_on 'nlohmann/json/nlohmann_json'

  def install
    patch_version = version.to_s.split('-')[1]
    mkdir 'credz-build' do
      system 'cmake', '..', "-DPATCH_VERSION=#{patch_version}", *std_cmake_args
      system 'make', 'install'
    end
  end

  test do
    system "#{bin}/credz -v"
    assert_match stable.version.to_s, shell_output("#{bin}/credz -v")
  end
end
