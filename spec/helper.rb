# encoding: ascii-8bit
# frozen_string_literal: true

def wait_to_listen(port)
  print `which lsof`
  p `lsof -ni :#{port}`

  while `lsof -ni :#{port}`.empty?
    print `docker ps`
    sleep(0.2)
  end
end
