class UsersController < ApplicationController

  def exhibition
    @products = Product.where(user_id: current_user , status: 0).includes(:item_images)
  end

  def trading
    @products = Product.where(user_id: current_user , status: 1).includes(:item_images)
  end

end
