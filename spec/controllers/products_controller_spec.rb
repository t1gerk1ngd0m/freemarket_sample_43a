require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "renders the :index template" do
      product = create(:product)
      get :index, params: { id: product }
      expect(response).to render_template :index
    end
  end

  describe "#show" do
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
  describe "#search" do
    it "assigns the requested product to @product" do
      create_list(:product,2)
      get :search, params: { keyword: "ネコ" }
      expect(assigns(:products).length).to eq 2
    end
  end
end

