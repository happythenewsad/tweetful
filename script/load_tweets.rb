Post.transaction do

  Twitter.user_timeline.each do |tweet|
    Post.create!(:content => tweet.text, :creator => tweet.user.values_at("screen_name").to_s)
  end

end

