class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.all.map {|review| { id: review.id, description: review.description, rating: review.rating, name: review.user.first_name, creator: review.user.id } }
  end

  def create_review
    @product = Product.find params[:id]
    @review = Review.create!(
      product_id: @product.id,
      user_id: session[:user_id],
      description: params[:products][:description],
      rating: params[:products][:rating])

      redirect_to :product
  end

  def destroy_review
    @review = Review.find params[:id]
    @product = Product.find_by(id: @review.product_id)
    if @review.user_id == session[:user_id]
      @review.destroy!

      redirect_to :back
    end
  end

end
