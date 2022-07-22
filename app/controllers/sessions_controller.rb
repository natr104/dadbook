class SessionsController < ApplicationController
    
    skip_before_action :require_login, only: [:new, :create]
    
    def create
        @user = User.find_by(email: params[:email])
        if @user
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = "Logged in! Welcome #{@user.name}!"
            redirect_to @user
        else
            flash.now.alert = "User with that email address does not exist."
            render :new
        end
    end

    def new
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "Logged out successfully."
    end
end
