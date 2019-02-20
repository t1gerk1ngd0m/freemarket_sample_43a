class ProductsController < ApplicationController
   before_action :set_product, only: [:show, :buy, :pay, :edit, :update, :destroy, :preview, :previewChange]

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
    @products = Product.includes(:item_images).order("id DESC").limit(4)
    @products_women = Product.where(category_large: 1).includes(:item_images).order("id DESC").limit(4)
    @products_men = Product.where(category_large: 2).includes(:item_images).order("id DESC").limit(4)
    @products_baby = Product.where(category_large: 3).includes(:item_images).order("id DESC").limit(4)
  end

  def show
    @products =Product.includes(:item_images).limit(6)
    @current_user_already_like = Like.exists?(user_id: current_user.id,product_id: @product.id)
    @products =Product.where(user_id: Product.find(params[:id]).user_id).includes(:item_images).order("id DESC").limit(6)
  end

  def search
    @products = Product.where("name Like(?)","%#{params[:keyword]}%")
  end

  def pay
      Payjp.api_key = 'sk_test_cbbb0d17e82b02a644fa9341'
      charge = Payjp::Charge.create(
      :amount => @product.price,
      :card => params['payjp-token'],
      :currency => 'jpy',
  )
      @product[:status] = 1
      @product.save
  end

  def edit
    @item_images = @product.item_images
  end

  def update
    if @product.update(product_params)
      if !(params[:item_images].nil?)
        params[:item_images]['name'].each do |a|
          @item_image = @product.item_images.create!(name: a)
        end
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def preview
    @item_images = @product.item_images
  end

  def previewChange
    @item_images = @product.item_images
    if @product.exhibition?
      @product[:status] = 3
      @product.save
    elsif @product.stopped?
      @product[:status] = 0
      @product.save
    end
    render :preview
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
    ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

