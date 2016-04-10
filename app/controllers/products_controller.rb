class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @productsByName = Product.order(:name).limit 5
    @productsByPrice = Product.order(:price).limit 2
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @product = Product.new
    render_page :new
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end

  def search
    @name_to_search = params[:nome]
    @products = Product.where "name like ?", "%#{@name_to_search}%"
  end

  def edit
    render_page :edit
  end

  def update
    if @product.update product_params
      flash[:notice] = "Produto atualizado com sucesso"
      redirect_to root_url
    else
      render_page :new
    end
  end

  private

  def set_product
    id = params[:id]
    @product = Product.find(id)
  end

  def render_page(view)
    @departments = Department.all
    render view
  end

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :department_id)
  end


end
