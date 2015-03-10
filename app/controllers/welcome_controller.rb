class WelcomeController < ApplicationController
  def index
    @casey = TweetReader.new
    @othertweets = @casey.anyones_tweets(params[:username])
  end
end
