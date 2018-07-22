class UsersController < ApplicationController
    
    
    def new
        @user = User.new
    end

    def index
        @users = User.order(id: :desc).all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            # Tell the UserMailer to send a welcome email after save
            UserMailer.welcome_email(@user).deliver_now
            redirect_to '/'
        else
            render :new
        end
    end 
    
    private

    def user_params
        params.require(:user).permit(
            :name, 
            :email, 
            :password, 
            :password_confirmation
        )
    end

end
