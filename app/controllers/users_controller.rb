class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  # TODO remove index and introduce admin interface
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # PATCH/PUT /users/1
  def update
    unless current_user.id.to_s == params[:id]
      redirect_to edit_user_path(current_user), flash: { error: t('user.flash.illegal_update') }
      return
    end

    if current_user.update(user_params)
      redirect_to current_user, notice: tm('flash.success.create', User)
    else
      render action: 'edit'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
