require 'rest-client'

class FetchController < ApplicationController

  def places
    coordinates = params[:coordinates]
    # byebug
    @response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{coordinates}&radius=750&type=bar&key=AIzaSyAIYICLeEdYXE_PCKhve_JNFWbqrNL3OD0"
    render json: @response, status: :ok
  end

end
