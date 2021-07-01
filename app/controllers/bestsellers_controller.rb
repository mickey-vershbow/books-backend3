class BestsellersController < ApplicationController

require 'faraday'

def current_list
    url = ENV["NYT_API_KEY"]
    @response = Faraday.get(url)
    response.status

    render json: @response
    end


end
