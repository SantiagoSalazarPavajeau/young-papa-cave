class UsersController < ApplicationController
    before_action :user_params, :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            #UserMailer.with(user: @user).welcome_email.deliver_later
            redirect_to user_path(@user)
        else
            render :new
        end

    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :bio)
    end

    def set_user
        @user = User.find(params[:id])
    end

   
end
