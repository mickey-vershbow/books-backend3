class ApplicationController < ActionController::API
# ApplicationController inherits from ActionController, built into rails, and then all other controllers inherit from ApplicationController. All other controllers will have access to functions defined here.

#  this macro tells rails to run the authorized funcion before completing any request to the API. (why, to make sure they are logged in before they use the API)

    before_action :authorized

# this method takes in a payload (a hash of key/values you want to save in the token) and assigns a token using a secret key. (in production this should an ENV variable.)
  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

# When determining is someone is logged in the frontend usually sends the token in the “Authorization” header preceded by the word bearer, this function checks to see if the header was sent.
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

#   If the auth header is present this function parses the string for the token and verifies it and pulls out the payload (the hash we stored in the token when we created it). If verification fails it will return nil.
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

#  If decoding the token is successful it grabs the username from the payload and searches our user in the database.
  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

#   returns true or false if user is logged in
  def logged_in?
    !!logged_in_user
  end

#  returns a message asking user to log in if unless logged_in return true
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
