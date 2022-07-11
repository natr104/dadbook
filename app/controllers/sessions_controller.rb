class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.user_id
    end
end
