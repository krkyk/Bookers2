class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @books=Book.all
    @user=User.find(current_user.id)
    @book=Book.new
  end

  def show
    @book1=Book.find(params[:id])
    @user=User.find(current_user.id)
    @book=Book.new
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
