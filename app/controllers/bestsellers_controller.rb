
class BestsellersController < ApplicationController

    require 'faraday'

    def current_list
        current_url = ENV["NYT_API_KEY_CURRENT"]
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

    def previous_list
        # dynamic_url = ENV["NYT_API_KEY_DYNAMIC"]
        date = "2010-05-27"
        response = Faraday.get("https://api.nytimes.com/svc/books/v3/lists/#{date}/hardcover-fiction.json?api-key=7FxA5tYHL2GPOCHfddNn3uVDouwtx71d")
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
