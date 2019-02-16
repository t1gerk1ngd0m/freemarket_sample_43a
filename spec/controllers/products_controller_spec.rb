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

  describe "POST #pay" do
    it "renders the :show template" do
      product = create(:product)
      post :pay, params: { id: product }
      expect(response).to render_template :show
    end
  end
  describe "GET #new" do
    it "renders the :new template" do
      product = create(:product)
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end
    it "renders the :edit template" do
      product = create(:product)
      get :edit, params: {id: product}
      expect(response).to render_template :edit
    end
  end

  describe "GET #preview" do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :preview, params: { id: product }
      expect(assigns(:product)).to eq product
    end
    it "renders the :preview template" do
      product = create(:product)
      get :preview, params: {id: product}
      expect(response).to render_template :preview
    end
  end
end

