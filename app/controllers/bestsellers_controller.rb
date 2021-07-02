class BestsellersController < ApplicationController

    require 'faraday'

    def current_list
        url = ENV["NYT_API_KEY"]
        response = Faraday.get(url)
        @response_result = JSON.parse(response.body)

    #     @booksBySchema = @response_result.results.books.map do |book|
    #         @container = {}

    # #     # book.results
    # #     # container.list_name = book.results.list_name
    # #     # container.updated = book.results.updated
    # #     # container.bestsellers_date = book.results.bestsellers_date
    # #     # container.publisher = book.results.publisher
    # #     # container.published_date = book.results.published_date

    # #     # books.results.books[]
    #     container.rank = book.rank
    #     container.rank_last_week = book.rank_last_week
        # container.rank = book.results.books[0].rank_last_week
        # container.weeks_on_list = book.results.books[0].weeks_on_list
        # container.title = book.results.books[0].title
        # container.author = book.results.books[0].author
        # container.description = book.results.books[0].description
        # container.book_image = book.results.books[0].book_image

        # buy-link name and url
        # container.name = book.results.books[0].buy_links[4].namecontainer.url = book.results.books[0].buy_links[4].url
        #     return container
        # end
        render json: @response_result
    end
end
