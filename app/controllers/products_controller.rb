class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.all.map {|review| { description: review.description, rating: review.rating, name: review.user.first_name } }
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

end
