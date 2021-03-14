class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
    
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path
    else
      root_path
    end
  end
  
  private
  def product_params
    params.require(:product).premit(:name, :description, :price, :product_image, :is_valid)
  end
end
