class ActivitiesController < ApplicationController

    def index
        @activities = Activity.all
    end

    def show
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @activity = user.activities.find_by(id: params[:id])
                redirect_to user_activities_path(user), alert: "Activity not found." if @activity.nil?
            end
        else
            @activity = Activity.find_by(id: params[:id])
            redirect_to activities_path if @activity.nil?
        end
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        if @activity.save!
            flash[:notice] = "New activity added!"
            redirect_to @activity
        else
            flash.now.alert = "Unable to add new activity."
            render :new
        end
    end

    def edit
        @activity = Activity.find(params[:id])
    end
    
    def update
        @activity = Activity.find(params[:id])
        @activity.update(activity_params)
        flash[:notice] = "Successfully updated activity!"
        redirect_to @activity
    end

    def destroy
        @activity = Activity.find(params[:id])
        @activity.delete
        flash[:notice] = "Activity deleted."
        redirect_to activities_path
    end

    private

    def activity_params
        params.require(:activity).permit(:name)
    end

end
