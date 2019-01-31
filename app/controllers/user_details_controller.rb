class UserDetailsController < ApplicationController

  def new
    @user_detail = User_detail.new
  end

  def create
    @user_detail = User_detail.new(user_detail_params)
    if @user_detail.save
      redirect_to creditcard_new_path
    else
      render :new
    end
  end

  private
  def user_detail_params
    params.require(:user_detail).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zip, :prefecture, :city, :block, :building).merge(user_id: current_user.id)
  end
end
