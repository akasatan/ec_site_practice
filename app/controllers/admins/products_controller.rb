class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
    
  def new
    @product = Product.new
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :product_image, :is_valid)
  end
end
