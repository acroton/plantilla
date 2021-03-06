class UsersController < ApplicationController

    before_action :authenticate_user!

    layout 'application', :except => :view
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params

        if @user.save
            redirect_to user_path(@user)
        else            
            render 'new'
        end
    end

    def edit
        @user = current_user
    end

    def show
        @user = User.find params[:id]
    end

    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)           
            redirect_to user_path(@user)
        else            
            render 'edit'
        end
    end

    def destroy
        @user = User.find params[:id]
        @user.destroy
        redirect_to users_path
    end
  
    private
    def user_params
        params.require(:user).permit!
    end
end