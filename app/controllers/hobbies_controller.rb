class HobbiesController < ApplicationController

    def index
        @hobbies = Hobby.all
    end

    def show
        if Hobby.find(params[:id])
            @hobby = Hobby.find(params[:id])
        else
            redirect_to hobbies_path
        end

    end

    def destroy
        @hobby = Hobby.find(params[:id])
        @hobby.delete
        redirect_to hobbies_path
    end
end
