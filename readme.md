WebSocket Example
-----------------

This is a small example of using Event Machine WebSocket to talk to a simple Sinatra web page.

Installation
------------

	gem install em-websocket
	gem install sinatra
	gem install shotgun

Run the example
---------------

	ruby ./websocket_server.rb
	shotgun config.ru

Open http://127.0.0.1:9393/ and you will see the following messages logged every 5 seconds:

	Socket has been opened!
	Heartbeat 1
	Heartbeat 2

The server will log something like this:

	Client connected: 
	{:path=>"/", :query=>{}, :origin=>"http://127.0.0.1:9393"}

License
-------

MIT License. See license.txt

2014-02-15 Erik Wrenholt