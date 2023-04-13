class SessionsController < ApplicationController

  def new
    if Current.user
      session.delete(:user_id)
      Current.user = nil
    end
  end

  def create
    user = User.find_by(name: user_params[:name])&.authenticate(user_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
