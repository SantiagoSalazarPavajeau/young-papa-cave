class UsersController < ApplicationController

    def new
        @user = User.new
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

   
end
