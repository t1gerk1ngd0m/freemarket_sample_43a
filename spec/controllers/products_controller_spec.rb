require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "renders the :index template" do
      product = create(:product)
      get :index
      expect(response).to render_template :index
    end
  end
end
