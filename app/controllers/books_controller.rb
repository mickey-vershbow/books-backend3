# CRUD functionality for user's books collection


class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  # can't hit these routes without authorization
  before_action :authorized

  # GET /books
  def index
    @books = Book.where(user_id: @user.id)

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    @book.user = @user

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :author, :publisher, :amazon_product_url, :rank, :rank_last_week, :weeks_on_list, :book_image, :buy_links, :user_id)
    end
end
