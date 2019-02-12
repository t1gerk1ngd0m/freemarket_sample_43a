require 'rails_helper'

describe OmniauthCallbacksController do
  describe "#facebook" do
      it "assigns the requested product to @product" do
        product = create(:product)
        get :show, params: { id: product }
        expect(assigns(:product)).to eq product
    end
  end
  describe "GET #show" do
     it "renders the :show template" do
        product = create(:product)
        get :show, params: { id: product }
        expect(response).to render_template :show
     end
  end
end
