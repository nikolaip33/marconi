class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create

        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        if @user
            render :edit
        else
            redirect_to signup_path
        end    
    end

    def update
        @user = User.find_by(id: params[:id])
        
        @user.update(user_params) if @user.try(:authenticate, params[:user][:password])
            
        redirect_to edit_user_path(@user)
    end

    def show
        @user = User.find_by(id:params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :admin)
    end
end
