class ProductsController < ApplicationController

	def index
		@productsByName = Product.order :name
		@productsByPrice = Product.order :price
	end
end
