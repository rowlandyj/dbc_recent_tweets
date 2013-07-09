get '/' do
  erb :index
end

post '/' do
  @user = TwitterUser.find_or_create_by_username(params[:user])

  if @user.tweets.empty? && @user.tweets_stale?
    @user.fetch_tweets!
  end
  sleep(5)
  @tweets = @user.tweets.limit(10)
  erb :_tweets, layout: false
end
