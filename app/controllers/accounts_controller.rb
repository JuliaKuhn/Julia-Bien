class AccountsController < ApplicationController
  before_action :check_login

  def show
    redirect_to edit_account_path
  end

  def edit; end

  def update
    @current_user.update(form_params)
    flash[:success] = 'Your account was updated!'
  end
  render 'edit'
  def form_params
    params.require(:user).permit(:username, :email, :avatar)
  end
end
