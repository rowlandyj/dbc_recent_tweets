get '/' do
  @status = Twitter.user_timeline('HellenKeller')
  p @status
  erb :index
end

get '/:username' do
  puts params[:username]
  @user = TwitterUser.find_or_create_by_username(params[:username])

  if @user.tweets.empty? && @user.tweets.stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  erb :user_page
end
