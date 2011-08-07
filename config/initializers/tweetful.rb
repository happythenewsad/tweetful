require 'tweetstream'

Process.fork do
  TweetStream::Client.new('abc', 'def').track('mac', 'lion') do |status|
    STDERR.puts "a tweet from #{status.user.screen_name}"
    Post.create! do |post|
      post.creator = status.user.screen_name
      post.content = status.text
    end
  end
end

