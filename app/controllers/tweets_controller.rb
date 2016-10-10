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
      config.consumer_key = "rbvbAxpHID3kMspenWWow"
      config.consumer_secret = "eKq2e3Sv7DZFEvVKQwecbRC1q5QiTG2E5HNuyk67A"
      config.access_token = "89089461-jBAqMjYgFXLf7IBs3tvYNR4kAhvJlxFHCysdAcGmd"
      config.access_token_secret = "QTlsbDOprs3ZLssBpCMeL0bmlofDZc76eh5CvQUXHqogZ"
    end
  end
end
