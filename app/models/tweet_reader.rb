class TweetReader

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def caseys_tweets
    @client.user_timeline("caseyk819")
  end

  def bieber_tweets
    @client.search("to:justinbieber marry me", result_type: "recent").take(20).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

  def anyones_tweets(username)
    @client.user_timeline(username)
  end
  
end
