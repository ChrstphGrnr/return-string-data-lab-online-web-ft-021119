class ProductsController < ApplicationController

    def index 
        @products = Prodcuts.all 
    end

    def show 
        @product = Product.find_by_id(parmas[:id])
    end

    def new
        @product = Prodcut.new
    end

    def create 
        @product = Product.new(product_params)
        @product.save
        redirect_to posts_path
    end

    def description
        product = Product.find_by_id(params[:id])
        render plain: product.description
    end

    def inventory
        product = Product.find_by_id(params[:id])
        product.inventory > 0 ? true : false
    end

    private 

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
