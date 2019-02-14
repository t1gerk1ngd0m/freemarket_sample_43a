class ProductsController < ApplicationController

  def new
    @product = Product.new
    @item_image = @product.item_images.build
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

  def index
    @product = Product.find(1)
    @products = Product.order("id DESC").limit(4)
  end

  def show
    @product =Product.find(params[:id])
    @products =Product.includes(:item_images).limit(6)
  end

  def buy
    @product =Product.find(params[:id])
    @products =Product.includes(:item_images).limit(6)
  end

  def pay
      @product =Product.find(params[:id])
      Payjp.api_key = ''
      charge = Payjp::Charge.create(
      :amount => @product.price,
      :card => params['payjp-token'],
      :currency => 'jpy',
  )
  def edit
    @product = Product.find(params[:id])
    @item_images = @product.item_images
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      if !(params[:item_images].nil?)
        params[:item_images]['name'].each do |a|
          @item_image = product.item_images.create!(name: a)
        end
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def preview
    @product = Product.find(params[:id])
    @item_images = @product.item_images
  end

  def previewChange
    product = Product.new(status_params)
    if product.update(status_params)
      render :preview
    else
      render :preview
    end
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
      :price,
      :condition,
      item_images_attributes: [:id, :name]
    )
  end

  def status_params
    params.require(:product).permit(
      :status
    )
  end
end
