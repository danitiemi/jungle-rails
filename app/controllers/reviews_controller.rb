class ReviewsController < ApplicationController
    # def create
    #   raise "Yay, I'm here!"
    # end
    
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user

    if @review.save
      redirect_to @product
    else
      render 'products/show'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

   private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def require_login
    redirect_to path_to_product unless current_user
  end

end
