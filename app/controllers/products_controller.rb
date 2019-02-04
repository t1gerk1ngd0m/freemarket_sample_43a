class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @group.save
      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_large, :category_middle, :category_small, :brand, :size, :shipping_charges_burden, :dispatch_area, :shipping_method, :number_of_the_days_to_ship, :price, :condition, images_attributes:[:id, :name])
  end
end
