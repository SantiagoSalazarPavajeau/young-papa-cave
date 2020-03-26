class UsersController < ApplicationController
    # before_action :user_params, :set_user, only: [:show, :edit, :update, :destroy]

    def welcome
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            #UserMailer.with(user: @user).welcome_email.deliver_later
        else
            render :new
        end

    end

    def show
        set_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

   
end
