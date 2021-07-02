class BestsellersController < ApplicationController

    require 'faraday'

    def current_list
        url = ENV["NYT_API_KEY"]
        response = Faraday.get(url)
        @response_result = JSON.parse(response.body)



    #     @books_array = []

    #     @response_result.results.books.map do |book|
    #         @container = {}


    # # #     # books.results.books[]
    #     @container.rank = book.rank
    #     @container.rank_last_week = book.rank_last_week
   
    #     @books_array.push(container)
    #     p @books_array
    #     end
        render json: @response_result
    end
end
