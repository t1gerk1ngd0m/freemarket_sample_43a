class ProductsController < ApplicationController
   before_action :set_product, only: [:show, :buy, :pay, :edit, :update, :destroy, :preview, :previewChange]
   before_action :set_category, only: [:show, :preview,]

  def new
    @product = Product.new
    @item_image = @product.item_images.build
    @category_larges = Category.roots
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

  def getCategory_middles
    @category_middles = Category.find(category_large_params).children
    respond_to do |format|
      format.json
    end
  end

  def getCategory_smalls
    @category_smalls = Category.find(category_middle_params).children
    respond_to do |format|
      format.json
    end
  end

  private
  def product_params
    a = params.require(:product).permit(
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
    a[:category_large] = a[:category_large].to_i
    a[:category_middle] = a[:category_middle].to_i
    a[:category_small] = a[:category_small].to_i
    return a
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category_large = Category.find_by(id: @product.category_large)
    @category_middle = Category.find_by(id: @product.category_middle)
    @category_small = Category.find_by(id: @product.category_small)
    @category_large ||= Category.new
    @category_middle ||= Category.new
    @category_small ||= Category.new
  end

  def category_large_params
    b = params[:category_large].to_i
    return b
  end

  def category_middle_params
    c = params[:category_middle].to_i
    return c
  end
end
