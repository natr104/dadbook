class ChildrenController < ApplicationController
    
    def index
        @children = Child.all
    end
    
    def show
        @child = Child.find(params[:id])
    end

    def new
        @child = Child.new(user_id: params[:user_id])
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
        @child = Child.find(params[:id])
    end

    def update
        @child = Child.find(params[:id])
        @child.update(child_params)
        flash[:notice] = "Successfully updated child information!"
        redirect_to child_path
    end


    private

    def child_params
        params.require(:child).permit(:name, :dob, :sex, :user_id)
    end
end
