class BestsellersController < ApplicationController
    
def current_list
    @response = Faraday.get "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=7FxA5tYHL2GPOCHfddNn3uVDouwtx71d"

    response.status

    render json: @response
    end


end
