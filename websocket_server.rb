#!/usr/bin/env ruby

require 'em-websocket'

=begin
Based on examples here:
https://github.com/igrigorik/em-websocket
=end

$sockets = []

counter = 0

EventMachine.run do
	
	EventMachine::add_periodic_timer(5) do
		$sockets.each do |socket|
			socket.send "Heartbeat #{counter+=1}"
		end
	end

	EventMachine::WebSocket.start(:host => '0.0.0.0', :port => 8080) do |socket|
		
		socket.onopen do |handshake|
			$sockets << socket
			puts "Client connected: "
			puts "#{ { :path => handshake.path, 
					   :query => handshake.query, 
					   :origin => handshake.origin } }"
		end

		socket.onclose do
			$sockets.delete( socket )
			puts "Client disconnected."
		end

		socket.onmessage do |msg|
			puts "Received Message: " + msg
			socket.send "Pong: " + msg
		end
		
		socket.onerror do |error|
			if error.kind_of?(EM::WebSocket::WebSocketError)
				puts "Error: " + error.message
			end
		end

	end
end

