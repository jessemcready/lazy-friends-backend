require 'rest-client'

class FetchController < ApplicationController
  skip_before_action :authorized, only: [:places]

  def places
    coordinates = params[:coordinates].split(',')
    lat = coordinates[0]
    long = coordinates[1]
    term = params[:suggestions]
    api_key = Rails.application.credentials.yelp_api_key
    byebug
    @response = RestClient.get "https://api.yelp.com/v3/businesses/search?term=food&latitude=#{lat}&longitude=#{long}&radius=750",  { :Authorization => "Bearer #{api_key}" }
    render json: @response, status: :ok
  end

end
