class TweetsController < ApplicationController
  def index
    @tweets = Tweet.not_deleted.order('t_created_at DESC')
    @tweets = @tweets.by_date(Time.now) if params[:today]
  end

  def refresh
    Tweet.find_for_laronda
    redirect_to tweets_path(today:params[:today])
  end

  def deleted
    @tweets = Tweet.deleted.order('t_created_at DESC')
  end

  def undelete
    tweet = Tweet.find(params[:id])
    tweet.undelete!
    redirect_to params[:return_to_url] || tweets_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.mark_as_deleted!
    redirect_to params[:return_to_url] || tweets_path
  end
end
