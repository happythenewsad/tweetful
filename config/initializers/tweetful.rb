
Resque.enqueue(TweetLoader) unless Resque.info[:workers] >= 1
STDERR.puts "TweetLoader initialized."