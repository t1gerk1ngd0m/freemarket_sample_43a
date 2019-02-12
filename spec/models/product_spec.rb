require 'rails_helper'

describe Product do
  describe '#create' do

   it "is valid with factory girl data" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a category_large" do
      product = build(:product, category_large: nil)
      product.valid?
      expect(product.errors[:category_large]).to include("can't be blank")
    end

    it "is invalid without a category_middle" do
      product = build(:product, category_middle: nil)
      product.valid?
      expect(product.errors[:category_middle]).to include("can't be blank")
    end

    it "is invalid without a category_small" do
      product = build(:product, category_small: nil)
      product.valid?
      expect(product.errors[:category_small]).to include("can't be blank")
    end

    it "is invalid without a shipping_charges_burden" do
      product = build(:product, shipping_charges_burden: nil)
      product.valid?
      expect(product.errors[:shipping_charges_burden]).to include("can't be blank")
    end

    it "is invalid without a dispatch_area" do
      product = build(:product, dispatch_area: nil)
      product.valid?
      expect(product.errors[:dispatch_area]).to include("can't be blank")
    end

    it "is invalid without a shipping_method" do
      product = build(:product, shipping_method: nil)
      product.valid?
      expect(product.errors[:shipping_method]).to include("can't be blank")
    end

    it "is invalid without a number_of_the_days_to_ship" do
      product = build(:product, number_of_the_days_to_ship: nil)
      product.valid?
      expect(product.errors[:number_of_the_days_to_ship]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a status" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a size" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end

  end
end
