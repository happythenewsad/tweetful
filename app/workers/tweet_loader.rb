require 'yaml'

class TweetLoader 
  @queue = :tweet_stream
  
  def self.perform(username)
    puts "this is the username i passed to TweetLoader: #{username}"
    credentials = YAML::load(File.read(File.join(RAILS_ROOT, 'config', 'not_public', 'twitter.yml')))['twitter']
    username, password = credentials['username'], credentials['password']
    TweetStream::Client.new(username, password).track('mac') do |status|
      STDERR.puts "[pid=#{Process.pid}]a tweet from #{status.user.screen_name}"
      Post.create! do |post|
        post.creator = status.user.screen_name
        post.content = status.text
      end
    end
  end #def
  
end #TweetLoader





