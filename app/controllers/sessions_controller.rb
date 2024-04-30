class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session) 

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password_digest])

    if user.present? 
      session[:user_id] = user.id  

      redirect_to root_path, notice: "wy wosli na sayt" 
    else 
      flash[:alert] = "Ne verny parol i email"  

      render :new
    end
  end

  def destroy 
    session.delete(:user_id) 

    redirect_to root_path, notice: "vy vysly iz acounta"
  end
end
