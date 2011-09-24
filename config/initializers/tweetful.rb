#STDERR.puts "TweetLoader initializing..."
#Resque.enqueue(TweetLoader) #unless Resque.info[:workers] >= 1
#STDERR.puts "#{Resque.info[:workers]} working"
#STDERR.puts "TweetLoader initialized."

STDERR.puts "starting rails, pid=#{Process.pid}"