class SessionsController < ApplicationController
    
    skip_before_action :require_login, only: [:new, :create]
    
    def create
        @user = User.find_by(email: params[:email])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def new
    end

    def destroy
        session.delete :user_id
        flash[:notice] = "Logged out successfully."
        redirect_to root_path
    end
end
