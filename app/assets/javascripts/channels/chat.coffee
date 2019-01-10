App.cable.subscriptions.create "ChatChannel", 

 connected: ->
   console.log("aacc");

    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $("#postaa").prepend([data]);
