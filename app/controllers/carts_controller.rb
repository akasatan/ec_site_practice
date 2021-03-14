class CartsController < ApplicationController
    def index
      @carts = Cart.where(user_id: current_user)
    end
    
    def create
      @cart = current_user.carts.build(cart_params)
      if @cart.save
        redirect_to products_path
      else
        render show
      end
    end
    
    def edit
      @carts = Carts.all
    end
    
    def update
      @cart = Cart.find(params[:id])
      if @cart.update
        redirect_to products_path
      else
        render index
      end
    end
    
    def destroy
      @cart = Cart.find(params[:id])
      @cart.destroy
      redirect_to products_path
    end
    
    private
    def cart_params
      params.require(:cart).permit(:user_id, :product_id, :quantity)
    end
    
end
