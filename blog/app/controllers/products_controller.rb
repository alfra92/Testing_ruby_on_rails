class ProductsController < ApplicationController
  def index
    @products = Product.all

  end
  def show
    @product = Product.find(params[:id])

  end
  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Novi proizvod je uspješno kreiran."
      redirect_to '/products'
    else
      flash.now[:error] = "Nije moguće spremiti novi proizvod. Polje Ime ne smije biti prazno. "
      render action: 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end





  private
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
