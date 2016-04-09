class ProductsController < ApplicationController

	def index
		@productsByName = Product.order(:name).limit 5
		@productsByPrice = Product.order(:price).limit 2
	end

	def create
		valores = params.require(:product).permit(:name, :description, :quantity, :price)
		product = Product.create valores
		redirect_to root_url
	end

	def destroy
		id = params[:id]
		Product.destroy id
		redirect_to root_url
	end
end
