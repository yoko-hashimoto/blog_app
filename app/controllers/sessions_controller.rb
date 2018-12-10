class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
      # redirect_to new_session_path
    end
  end
end
