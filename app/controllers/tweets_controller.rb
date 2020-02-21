class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:show, :update, :destroy]


  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all.includes(:user)

    @tweets = @tweets.username(params[:user]) if params[:user].present?

  end

  def feed
    @tweet = Tweet.include(:user).where(user: current_user.following_users)

    render :index
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render :show, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    if @tweet.update(tweet_params)
      render :show, status: :ok, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:username, :tweet)
    end
end
