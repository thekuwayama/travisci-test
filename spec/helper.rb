# encoding: ascii-8bit
# frozen_string_literal: true

def wait_to_listen(port)
  sleep(0.2) while `lsof -ni :#{port}`.empty?
end
