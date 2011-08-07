#NOT CURRENTLY IN USE - SEE INITALIZERS
class TweetLoader 
  @queue = :tweet_queue
  
  def self.perform(snippet_id)
    Post.transaction do
      Twitter.user_timeline.first.each do |tweet|
        Post.create!Post.create(:content => tweet.text, :creator => tweet.user.values_at("screen_name").to_s)
      end
    end
  end #def
  
end #TweetLoader