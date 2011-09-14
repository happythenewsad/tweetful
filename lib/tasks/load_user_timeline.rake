

namespace :timeline do
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
  
  
end #timeline

