require 'rails_helper'

describe User do
  describe '#create' do

   it "is valid with a nickname, email, password, password_confirmation, tel_confirmation, first_name, last_name, first_name_kana, last_name_kana, zip, prefecture, city, block, building, phone_number, card_number, expiration_month, expiration_year, security_code" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a email no character before @ " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email no character after @ " do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes non-alphanumeric characters " do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
      binding.pry
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end



  end
end
