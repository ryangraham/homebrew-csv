# frozen_string_literal: true

class Csv < Formula
  desc 'CSV Parser for C++'
  homepage 'https://github.com/ryangraham/csv'
  url 'https://github.com/ryangraham/csv/archive/v0.0.1-0e290d6.tar.gz'
  sha256 '3c0b9156ed0bff2c635af24b7e7a421fbf91bbde6e9dcf705ac0cdad86a6880b'
  head 'https://github.com/ryangraham/csv.git', branch: 'master'
  version '0.0.1'

  depends_on 'cmake'
  depends_on 'range-v3'

  def install
    mkdir 'csv-build' do
      system 'cmake', '..', *std_cmake_args
      system 'make', 'install'
    end
  end

  # TODO
  # test do
    
  # end
end
