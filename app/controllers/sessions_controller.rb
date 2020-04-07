class SessionsController < ApplicationController

    def welcome
    end
    
    def new
    end

    def create
        if params[:username] && params[:password]
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.user_id
                redirect_to @user
            end
        else
            redirect_to root_path :alert "Please enter a correct username and password"
        end

    end

    def destroy

    end
end