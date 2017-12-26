class SessionsController < ApplicationController

  def new
  end

def create
  @form_data = params.require(:session)
  @username = @form_data[:username]
  @password = @form_data[:password]
  @user = User.find_by(username: @username).try(:authenticate, @password)

if @user
session[:user_id] = @user.id


redirect_to root_path
else
render "new"
end

end

def destroy
  reset_session

  redirect_to new-session_path
end
end



end
