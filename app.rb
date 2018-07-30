#! /usr/bin/env ruby
# frozen_string_literal: true

require 'config/boot'

files = Dir.glob(File.join(Application.root, 'app', '**', '*rb'))
files.each { |file| require file }
