class ProjectsController < ApplicationController
    # before_action :project_params, :set_project, only: [:edit, :update, :show, :destroy]

    def index
        user = User.find_by(id: params[:user_id])
        if user
            @projects = user.projects
        else
            redirect_to root_path
        end
        # add no user else statement
    end
    
    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
        @hobbies = Hobby.all
    end

    def create
        @project = current_user.projects.create(project_params)
        redirect_to user_project_path(current_user, @project)
        #use "hobby_title" to create a hobby it seems its already creating a hobby
    end

    private

    def project_params
        params.require(:project).permit(:title, :description, :hobby_title)
    end

    def set_project
        @project = Project.find(params[:id])
    end
end
