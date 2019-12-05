class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:source_path] || root_path
    else
      flash.now[:alert] = 'Введите Вашу почту и пароль'
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
