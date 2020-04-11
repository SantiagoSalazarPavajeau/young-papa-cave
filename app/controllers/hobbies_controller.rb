class HobbiesController < ApplicationController

    def index
        @hobbies = Hobby.all
    end

    def show
        @hobby = Hobby.find(params[:id])
    end

    def destroy
        @hobby = Hobby.find(params[:id])
        @hobby.delete
        redirect_to hobbies_path
    end
end
