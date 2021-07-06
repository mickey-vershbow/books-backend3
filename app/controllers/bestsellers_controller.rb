
class BestsellersController < ApplicationController

    require 'faraday'
    API_KEY = ENV["NYT_API_KEY"]

        def current_list
            current_url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=#{API_KEY}"
            response = Faraday.get(current_url)
            @response_result = JSON.parse(response.body, { object_class: OpenStruct })

            @final_result = @response_result.results.books.map do |book|

                container = {
                    rank: book[:rank],
                    rank_last_week: book[:rank_last_week],
                    weeks_on_list: book[:weeks_on_list],
                    publisher: book[:publisher],
                    description: book[:description],
                    title: book[:title],
                    author: book[:author],
                    book_image: book[:book_image],
                    # TODO: add buy_links
                }
            end
            render json: @final_result
    end

        def search_list
            date = "2017-05-27"
            search_url = "https://api.nytimes.com/svc/books/v3/lists/#{date}/hardcover-fiction.json?api-key=#{API_KEY}"
            response = Faraday.get(search_url)
            @response_result = JSON.parse(response.body, { object_class: OpenStruct })

            @final_result = @response_result.results.books.map do |book|

                container = {
                    rank: book[:rank],
                    rank_last_week: book[:rank_last_week],
                    weeks_on_list: book[:weeks_on_list],
                    publisher: book[:publisher],
                    description: book[:description],
                    title: book[:title],
                    author: book[:author],
                    book_image: book[:book_image],
                    # TODO: add buy_links
                }
            end
            render json: @final_result
    end

end
