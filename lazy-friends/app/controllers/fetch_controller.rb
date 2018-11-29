require 'rest-client'

class FetchController < ApplicationController

  def places
    coordinates = params[:coordinates]
    api_key = Rails.application.credentials.google_api_key
    
    @response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{coordinates}&radius=750&type=bar&key=#{api_key}"
    render json: @response, status: :ok
  end

end
