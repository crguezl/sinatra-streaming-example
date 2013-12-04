desc "run the redis server"
task :redis do
  sh "redis-server"
end

desc "run the web app and the worker"
task :default do
  sh "bundle exec foreman start"
end

desc "run the client"
task :client do
  sh "curl -v http://localhost:5000/stream"
end

task :help do
  puts %{A simple demonstration of streaming Redis pub/sub data

Open three terminals and run:
  rake redis
  rake 
  rake client

  }
end
