class TellsController < ApplicationController

  def new
    @tell = Tell.new
  end

  def create
    @tell = Tell.new(tell_params)
    if @tell.save
      redirect_to user_detail_new_path
    else
      render :new
    end
  end

  private
  def tell_params
    params.require(:tell).permit(:tell_number).merge(user_id: current_user.id)
  end
end
