class BestsellersController < ApplicationController

    require 'faraday'

        def current_list
            url = ENV["NYT_API_KEY"]
            response = Faraday.get(url)
            # object class makes the data accessible
            @response_result = JSON.parse(response.body, { object_class: OpenStruct })

            books_array = []

            @response_result.results.books.map do |book|
                container = {}

                # [:rank] specifies that it's the key of the hash. Ruby way of accessing an object
                container[:rank] = book[:rank]
                container[:title] = book[:title]

            books_array.push(container)
        end
        render json: books_array
    end
end
