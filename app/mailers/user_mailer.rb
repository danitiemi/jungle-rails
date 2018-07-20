class UserMailer < ApplicationMailer

    default from: 'no-reply@jungle.com'
 
    def welcome_email(user)
      @user = user
    #   @user = params[:user]
      @url  = 'http://localhost:3000/login'
      mail(to: @user.email, subject: 'Welcome to Jungle - Your Wild Shopping') 
    #   do |format|
    #     format.html { render 'another_template' }
    #     format.text { render plain: 'Render text' }
    #     end
    end

    def receipt_email(order)
        @order = order
        mail(to: @order.email, subject: 'Thanks for shopping! Your wild receipt is here')
    end
end
