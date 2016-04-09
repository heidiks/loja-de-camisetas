class ProductsController < ApplicationController

	def index
		@productsByName = Product.order(:name).limit 5
		@productsByPrice = Product.order(:price).limit 2
	end
end
