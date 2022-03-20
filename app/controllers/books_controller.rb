class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)
    @user=User.find(current_user.id)
    @books=Book.all
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=User.find(current_user.id)
  end

  def show
    @book1=Book.find(params[:id])
    @book=Book.new
    @user=User.find(@book1.user.id)
  end

  def edit
    @book=Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
    redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
