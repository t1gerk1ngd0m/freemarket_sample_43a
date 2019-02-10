class ProductsController < ApplicationController

  def new
    @product = Product.new
    @item_image = @product.item_images.build

    @category_larges = Category.roots
    @category_middles = []
    @category_smalls = []
    for @category_large in @category_larges
      @category_middle = @category_large.children
      for @category_middle_small in @category_middle
        @category_small = @category_middle_small.children
        @category_smalls << @category_small
      end
      @category_middles << @category_middle
    end

    @sizes = Size.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:item_images]['name'].each do |a|
        @item_image = @product.item_images.create!(name: a)
      end
      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end
  end

  def show
    @product =Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_large,
      :category_middle,
      :category_small,
      :brand,
      :size,
      :shipping_charges_burden,
      :dispatch_area,
      :shipping_method,
      :number_of_the_days_to_ship,
      :price, :condition,
      item_images_attributes: [:name]
    )
  end
end
