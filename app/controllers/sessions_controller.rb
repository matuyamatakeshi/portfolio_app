class SessionsController < ApplicationController
  
  skip_before_action :login_required

  def new  
  end

  def create
    user = User.find_by(mail: session_params[:mail])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'ようこそ'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to posts_path, alert: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:mail, :password)
  end

end
