class ProjectsController < ApplicationController
    # before_action :set_project

    def index
        user = User.find_by(id: params[:user_id])
        if user
            @projects = user.projects
        else
            redirect_to root_path
        end
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
        if @project.save
            redirect_to user_project_path(current_user, @project)
        else
            redirect_to new_user_project_path(current_user), notice: 'The project needs a title, a 100 character description and a hobby it belongs to'
        end
        #use "hobby_title" to create a hobby it seems its already creating a hobby
    end

    def edit
        @project = Project.find(params[:id])
        @hobbies = Hobby.all
        if current_user == @project.user
            @project = Project.find(params[:id])
        else
            redirect_to user_path(@project.user)
        end
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to user_project_path(current_user, @project)
    end


    private

    def project_params
        params.require(:project).permit(:title, :description, :hobby_title)
    end

    # def set_project
    #     @project = Project.find(params[:id])
    # end
end
