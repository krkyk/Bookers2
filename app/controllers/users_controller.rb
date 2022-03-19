class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @book=Book.new
    @books=Book.where(id: params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def index
    @users=User.all
    @user=User.find(current_user.id)
  end
  
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction)
  end
  
end
