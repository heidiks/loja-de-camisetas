class ProductsController < ApplicationController

  def index
    @productsByName = Product.order(:name).limit 5
    @productsByPrice = Product.order(:price).limit 2
  end

  def create
    valores = params.require(:product).permit(:name, :description, :quantity, :price)
    @product = Product.new valores
    if @product.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def destroy
    id = params[:id]
    Product.destroy id
    redirect_to root_url
  end

  def search
    @name_to_search = params[:nome]
    @products = Product.where "name like ?", "%#{@name_to_search}%"
  end
end
