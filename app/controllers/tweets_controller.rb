class TweetsController < ApplicationController
  before_action :create_client

    def index
    batch_size = 10
    @twitter_handle = "nilesh_ajwelkar"

    @tweets = @client.user_timeline(@twitter_handle).take(batch_size)
    @friends = @client.friends(@twitter_handle).take(batch_size)
    @followers = @client.followers(@twitter_handle).take(batch_size)

    # You can only get mentions for the authenticated user, not any handle you pass to the client.
    # @mentions = @client.mentions_timeline.take(batch_size)
  end


  private
    def create_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ""
      config.consumer_secret = ""
      config.access_token = ""
      config.access_token_secret = ""
    end
  end
end
