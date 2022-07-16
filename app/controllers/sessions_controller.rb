class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.user_id
        redirect_to '/'
    end

    def new
    end

    def destroy
        session.delete :user_id
    end
end
