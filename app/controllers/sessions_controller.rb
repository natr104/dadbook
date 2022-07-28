class SessionsController < ApplicationController
    
    skip_before_action :require_login, only: [:new, :create, :omniauth]
    
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

    def omniauth
        @user = User.find_or_create_by!(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.provider = auth['provider'].capitalize
            u.password = u.password_confirmation = SecureRandom.base58(24)
        end
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "Logged in through Github! Welcome #{@user.name}!"
            redirect_to @user
        else
            flash[:alert] = "Github authentication unsuccessful."
            redirect_to root_path
        end
    end

    def new
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "Logged out successfully."
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
