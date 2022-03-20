class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @book1=Book.where(user_id:@user.id)

  end

  def edit
    @user=User.find(current_user.id)
  end

  def index
    @users=User.all
    @user=User.find(current_user.id)
  end


  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction)
  end

end
