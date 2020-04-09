class SessionsController < ApplicationController

    def welcome
    end
    
    def new
    end

    def facebook
        @user = User.find_or_create_by(username: auth['info']['name'], uid: auth['uid'])
       
        session[:user_id] = @user.id
       
        redirect_to root_path
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
        session.delete :user_id
        redirect_to root_path

    end

    private
 
    def auth
        request.env['omniauth.auth']
    end
end