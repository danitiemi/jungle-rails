class UsersController < ApplicationController
    
    
    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            # Tell the UserMailer to send a welcome email after save
            UserMailer.with(user: user).welcome_email.deliver_now
            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end 
    
    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
