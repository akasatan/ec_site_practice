class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = Cart.new
  end
  
  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end
  
  def create
    @product = Product.new(product_params)
    if admin_signed_in?
      @product.save!
      redirect_to admins_products_path
    else
      redirect_to root_path
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :product_image, :is_valid)
  end
  
end
