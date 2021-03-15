class ProductsController < ApplicationController
  before_action :ensure_correct_admin, only: [:create, :destroy]
  
  def index
    @products = Product.all
    @cart = Cart.new
  end
  
  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end
  
  def create
    if admin_signed_in?
      @product = Product.new(product_params)
      @product.save
      redirect_to admins_products_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    if admin_signed_in?
      @product = Product.find(params[:id])
      if @product.destroy
        redirect_to admins_products_path
      else
        render index
      end
    else
      redirect_to products_path
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :product_image, :is_valid)
  end
  
  def ensure_correct_admin
    if admin_signed_in?
      @admin = Admin.find(params[:id])
      if  @admin == current_admin
      else  redirect_to root_path
      end
    end
  end
  
end
