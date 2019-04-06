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
