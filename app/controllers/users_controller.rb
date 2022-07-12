class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)

        @user.email.downcase!

        if @user.save
            flash[:notice] = "Account created! Welcome to Dadbook!"
            redirect_to users_path
        else
            flash.now.alert = "Unable to create account - invalid email address or password"
            render :new
        end

    end

    def edit
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
