class UsersController < ApplicationController

# This required the authorization method from the ApplicationController to be run before only the autologin method of this controller.
  before_action :authorized, only: [:auto_login]

  # REGISTER
#   This creates a new user using the data returned from the user_params method. If the new user is validated (matches the user schema) then a JWT token is assigned and returned in a json object to the client.
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
# Looks up the username and compares the password passed in, if all checks out, generate an JWT token and sends it over in a JSON object.
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

#  returns the user object as JSON assuming the user has previous logged in (in which case the authenticate function will run successfully)
  def auto_login
    render json: @user
  end

  private

#   private function that parses the needed data from the request to create a new user
  def user_params
    params.permit(:username, :password, :age)
  end

end
