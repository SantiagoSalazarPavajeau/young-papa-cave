class SessionsController < ApplicationController

    def welcome
    end
    
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user            
        else
            redirect_to login_path, notice: "Please enter a correct username and password"
        end
    end

    def destroy

    end
end