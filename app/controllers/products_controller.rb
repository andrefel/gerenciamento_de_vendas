class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def creat
        @product = Product.new(Product_params)
        if @product.save
            redirect_to product_path(@product.id)
        else
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path(@product)
        else
            render :new
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy

        redirect_to product_path
    end

    private

    def Product_params
        params.require(:product).permit(
            :name,
            :description,
            :price
        )
    end
    
end
