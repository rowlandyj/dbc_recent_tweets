class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    self.tweets.delete_all
    tweets=Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      self.tweets << Tweet.create(content: tweet.text)
    end
  end

  def tweets_stale?
    self.tweets.empty? || (Time.now - self.tweets.first.created_at > 900)
  end
end
