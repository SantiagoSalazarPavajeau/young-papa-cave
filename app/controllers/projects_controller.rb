class ProjectsController < ApplicationController
    # before_action :project_params, :set_project, only: [:edit, :update, :show, :destroy]

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
    end

    private

    # def project_params
    #     params.require(:project).permit(:title, :description, :hobby_title)
    # end

    def set_project
        @project = Project.find(params[:id])
    end
end
