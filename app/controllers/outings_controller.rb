class OutingsController < ApplicationController

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            render :new, alert: "User not found."
        else
            @outing = Outing.new(user_id: current_user.id)
        end
    end

    def create
        @outing = Outing.create!(outing_params)
        redirect_to @outing
    end

    def show
        @outing = Outing.find_by(id: params[:id])
        redirect_to outings_path, alert: "Outing not found" if @outing.nil?
    end

    def index
        @outings = Outing.all
    end

    private

    def outing_params
        params.require(:outing).permit(:outing_date, :activity_id, :user_id)
    end
end
