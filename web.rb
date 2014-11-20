require 'redis'
require 'sinatra'

configure do
  redis_url = ENV["REDISTOGO_URL"] || "redis://localhost:6379"
  uri = URI.parse(redis_url)
  set :redis, Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
  """
  <a href="https://github.com/crguezl/sinatra-streaming-example">https://github.com/crguezl/sinatra-streaming-example</a>
  <pre>
  curl -v http://localhost:5000/stream
  curl -v https://sinatra-streaming-example.herokuapp.com/stream
  </pre>
  """
end

get '/stream' do
  puts "connection made"

  stream do |out|
    settings.redis.subscribe 'time' do |on|
      on.message do |channel, message|
        out << "#{message}\n"
      end
    end
  end
end
