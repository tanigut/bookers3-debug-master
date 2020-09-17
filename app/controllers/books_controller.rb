class BooksController < ApplicationController

  before_action :authenticate_user!

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def index
    #@books = Book.all
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @book_comment = BookComment.new
    @book_comments = BookComment.all
  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      flash.now[:alert] = "error"
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user != @book.user
    redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      flash.now[:alert] = "error"
      render "edit"
    end
  end

  def delete
    @book = Book.find(params[:id])
    @book.destoy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
