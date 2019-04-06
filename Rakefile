# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'openssl'
require 'fileutils'

RuboCop::RakeTask.new

TMP_DIR = __dir__ + '/tmp'
TEXT    = TMP_DIR + '/text'

directory TMP_DIR

file TEXT => TMP_DIR do
  puts "generate #{TEXT}..."
  text = OpenSSL::Random.random_bytes(20)
  File.write(TEXT, text)
end

task spec_sample: [TEXT]
RSpec::Core::RakeTask.new(spec: :spec_sample)

task default: %i[rubocop spec]
