class UsersController < ApplicationController
    # before_action :user_params, :set_user, only: [:show, :edit, :update, :destroy]

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
            flash[:notice] = "The username can't be taken, can't be blank and the password has to be at least 7 characters"
            render 'new'
        end

    end

    def show
        redirect_to user_projects_path(set_user)
    end

    def destroy
        session.delete :user_id
        set_user.delete 
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :bio, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

   
end
