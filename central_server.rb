require 'socket'
require './bidirectional_server.rb'

class CentralServer < BidirectionalServer

  #register peer server
  def register_peer
  end

  def register_backup
  end

  def update_page
  end

  def browse_page
  end

  def pong(host, port)
    send_message("PONG", host, port) 
  end
  

  # override the accept_handler here
  def accept_handler(client)
    while line = client.gets
      if(request_type(line.chop) == 0)
        line_array = line.split(":")
        pong(client.peeraddr[2], line_array[1].to_i)
      end 
    end
    super
  end


  private :request_type, :register_peer, :register_backup, :update_page, :browse_page

end

