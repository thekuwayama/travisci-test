# encoding: ascii-8bit
# frozen_string_literal: true

RSpec.describe 'sample' do
  context 'sample' do
    let(:text) do
      File.read(__dir__ + '/../tmp/text')
    end

    it 'should be longger than 10 bytes' do
      expect(text.length).to be > 10
    end
  end
end

require_relative 'helper'
require 'socket'
PORT = 4433
TMP_DIR = __dir__ + '/../tmp'

RSpec.describe 'wait for s_server' do
  context 'test' do
    before do
      cmd = 'openssl s_server ' \
            + '-cert /tmp/server.crt ' \
            + '-key /tmp/server.key ' \
            + '-tls1_3 ' \
            + '-www ' \
            + '-quiet '
      pid = spawn('docker run ' \
                  + "--volume #{TMP_DIR}:/tmp " \
                  + "--publish #{PORT}:#{PORT} " \
                  + 'openssl ' + cmd)
      Process.detach(pid)
    end

    let(:one) do
      wait_to_listen(PORT)

      1
    end

    after do
      `docker ps -ql | xargs docker stop`
    end

    it 'could access to server' do
      expect(one).to eq 1
    end
  end
end
