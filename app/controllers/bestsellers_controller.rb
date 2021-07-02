class BestsellersController < ApplicationController

    require 'faraday'

        def current_list
            url = ENV["NYT_API_KEY"]
            response = Faraday.get(url)
            @response_result = JSON.parse(response.body, { object_class: OpenStruct })

            @books_array = @response_result.results.books.map do |book|
                container = {}

                container.rank = book.rank
                container.rank_last_week = book.rank_last_week

                return container
            end
        render json: @books_array
    end
end
