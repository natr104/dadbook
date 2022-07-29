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

    def update
        @outing = Outing.find(params[:id])
        @outing.update(outing_params)
        flash[:notice] = "Successfully updated outing!"
        redirect_to @outing
    end

    def edit
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @outing = user.outing.find_by(id: params[:id])
                redirect_to user_outings_path(user), alert: "Outing not found." if @outing.nil?
            end
        else
            @outing = Outing.find_by(id: params[:id])
            redirect_to outings_path if @outing.nil?
        end
    end

    def destroy
        @outing = Outing.find(params[:id])
        @outing.destroy
        flash[:notice] = "Outing deleted."
        redirect_to outings_path
    end

    private

    def outing_params
        params.require(:outing).permit(:outing_date, :activity_id, :user_id)
    end
end
