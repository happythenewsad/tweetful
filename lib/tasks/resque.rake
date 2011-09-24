require "resque/tasks"
require "shellwords"

task "resque:setup" => :environment


#QUEUE=tweet_stream rake environment resque:work

namespace :twitify do
  desc "loads all of a user's previous tweets into the DB"
  task :load => :environment do

    tweets = Twitter.user_timeline("happythenewsad", :count => 199)
    tweets.each do |status|
      Post.create! do |post|
        post.creator = status.user.screen_name
        post.content = status.text
      end   
    end
    
    puts Twitter.rate_limit_status.remaining_hits.to_s + 
      " Twitter API request(s) remaining this hour"
  end #load
  
  #syntax: timeline:startstream[happythenewsad]
  desc "opens a stream connection with twitter"
  task :startstream, [:username] => :environment do |t, args|
    puts "about to enqueue..."
    TweetLoader.perform(args[:username])
    #`#{Shellwords.escape "QUEUE=tweet_stream rake resque:work"}`
    #Resque.enqueue(TweetLoader, args[:username])
  end #load
  
  desc "closes a stream connection with twitter"
  task :stopstream, [:username] => :environment do |t, args|
    puts "about to dequeue..."
    #Resque::Job.destroy(:tweet_stream, 'TweetLoader', args[:username])
    #Resque.remove_queue(:tweet_stream)
  end #load

  
end #timeline
