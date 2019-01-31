class CreditcardsController < ApplicationController

  def new
    @creditcard = Creditcard.new
  end

  def create
    @creditcard = Creditcard.new(creditcard_params)
    if @creditcard.save
      redirect_to creditcard_create_path
    else
      render :new
    end
  end

  private
  def creditcard_params
    params.require(:creditcard).permit(:card_number, :expiration_date, :security_code).merge(user_id: current_user.id)
  end
end
