class SessionsController < ApplicationController

    def welcome
        if session[:user_id]
            session.delete :user_id
        end
        @user = User.most_active.first
    end
    
    def new
    end

    def facebook
        @user = User.create(username: auth['info']['name'])
        if @user
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

    def create
        if auth
            @user = User.find_or_create_by(username: auth['info']['name'])
            @user.password = SecureRandom.hex(9)
            if @user.save
                session[:user_id] = @user.id
                redirect_to @user
            else
                redirect_to root_path
            end
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to @user            
            else
                redirect_to login_path, notice: "Please enter a correct username and password"
            end
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