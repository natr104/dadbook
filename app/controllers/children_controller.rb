class ChildrenController < ApplicationController
    
    def index
        if params[:user_id]
            @children = User.find(params[:user_id]).children
        else
            @children = Child.all
        end
    end
    
    def show
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @child = user.children.find_by(id: params[:id])
                redirect_to user_children_path(user), alert: "Child not found." if @child.nil?
            end
        else
            @child = Child.find_by(id: params[:id])
            redirect_to children_path if @child.nil?
        end
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
        else
            @child = Child.new(user_id: params[:user_id])
        end
    end

    def create
        @child = Child.create(child_params)
        if @child.save
            flash[:notice] = "Child added!"
            redirect_to @child
        else
            flash.now.alert = "Unable to add child"
            render :new
        end
    end

    def edit
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @child = user.children.find_by(id: params[:id])
                redirect_to user_children_path(user), alert: "Child not found." if @child.nil?
            end
        else
            @child = Child.find_by(id: params[:id])
            redirect_to children_path if @child.nil?
        end
    end

    def update
        @child = Child.find(params[:id])
        @child.update(child_params)
        flash[:notice] = "Successfully updated child information!"
        redirect_to @child
    end

    def destroy
        @child = Child.find(params[:id])
        @child.delete
        flash[:notice] = "Child deleted."
        redirect_to user_path(current_user)
    end


    private

    def child_params
        params.require(:child).permit(:name, :dob, :sex, :user_id)
    end
end
