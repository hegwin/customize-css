class PusherController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    10.times do |i|
      response.stream.write "event: message\n"
      response.stream.write "data: Hello world ##{i+1}\n\n"
      sleep 1
    end

    response.stream.write "event: done\n"
    response.stream.write "data: Done\n\n"
  rescue IOError
    # client disconneted
  ensure
    response.stream.close
  end

  def index
  end
end
