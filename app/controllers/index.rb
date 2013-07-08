get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  if @user.tweets.empty?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
end
