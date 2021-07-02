# class BestsellersController < ApplicationController

#     require 'faraday'

#         def current_list
#             url = ENV["NYT_API_KEY"]
#             response = Faraday.get(url)
#             # object class makes the data accessible
#             @response_result = JSON.parse(response.body, { object_class: OpenStruct })

#             books_array = []

#             @response_result.results.books.map do |book|
#                 container = {}

#                 # [:rank] specifies that it's the key of the hash. Ruby way of accessing an object
#                 container[:rank] = book[:rank]
#                 container[:title] = book[:title]

#             books_array.push(container)
#         end
#         render json: books_array
#     end
# end


class BestsellersController < ApplicationController

    require 'faraday'

    def current_list
        url = ENV["NYT_API_KEY"]
        response = Faraday.get(url)
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
