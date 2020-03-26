class ProjectsController < ApplicationController
    before_action :project_params, :set_project, only: [:edit, :update, :show, :destroy]

    def show
    end

    private

    def project_params
        params.require(:project).permit(:title, :description)
    end

    def set_project
        @project = Project.find(params[:id])
    end
end
