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

    it "is invalid with a email not includes @ " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes no character before @ " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes no character after @ " do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "is invalid with a email includes non-alphanumeric characters " do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
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

    it "is invalid without a tel_confirmation" do
      user = build(:user, tel_confirmation: nil)
      user.valid?
      expect(user.errors[:tel_confirmation]).to include("can't be blank")
    end

    it "is invalid without a tel_confirmation that has less than 9 characters " do
      user = build(:user, tel_confirmation: "123456789")
      user.valid?
      expect(user.errors[:tel_confirmation][0]).to include("is invalid")
    end

    it "is invalid without a tel_confirmation that has more than 12 characters " do
      user = build(:user, tel_confirmation: "123456789012")
      user.valid?
      expect(user.errors[:tel_confirmation][0]).to include("is invalid")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana includes non-KANA characters " do
      user = build(:user, first_name_kana: "カナa")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("is invalid")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana includes non-KANA characters " do
      user = build(:user, last_name_kana: "カナa")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("is invalid")
    end

    it "is invalid without a zip" do
      user = build(:user, zip: nil)
      user.valid?
      expect(user.errors[:zip]).to include("can't be blank")
    end

    it "is invalid with a zip includes other than integer or hyphen in the first 3 digits " do
      user = build(:user, zip: "12a-1234")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a zip includes the first number is 4 digits or more " do
      user = build(:user, zip: "1234-1234")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a zip includes the first number is 2 digits or less " do
      user = build(:user, zip: "12-1234")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a zip includes other than integer or hyphen in the last 4 digits" do
      user = build(:user, zip: "123-123a")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a zip includes the last number is 5 digits or more " do
      user = build(:user, zip: "123-12345")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a zip includes the last number is 3 digits or less " do
      user = build(:user, zip: "123-123")
      user.valid?
      expect(user.errors[:zip][0]).to include("is invalid")
    end

    it "is invalid with a prefecture no chose " do
      user = build(:user, prefecture: "--未選択--")
      user.valid?
      expect(user.errors[:prefecture][0]).to include("is invalid")
    end

    it "is invalid without a city" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a block" do
      user = build(:user, block: nil)
      user.valid?
      expect(user.errors[:block]).to include("can't be blank")
    end

    it "is invalid without a card_number" do
      user = build(:user, card_number: nil)
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "is invalid with a card_number that has less than 13 characters " do
      user = build(:user, card_number: "1234567890123")
      user.valid?
      expect(user.errors[:card_number][0]).to include("is invalid")
    end

    it "is invalid with a card_number that has more than 17 characters " do
      user = build(:user, card_number: "12345678901234567")
      user.valid?
      expect(user.errors[:card_number][0]).to include("is invalid")
    end

    it "is invalid with a card_number includes non-integer characters" do
      user = build(:user, card_number: "12345678901234ab")
      user.valid?
      expect(user.errors[:card_number][0]).to include("is invalid")
    end

    it "is invalid with a duplicate card_number" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:card_number]).to include("has already been taken")
    end

    it "is invalid without a expiration_month" do
      user = build(:user, expiration_month: nil)
      user.valid?
      expect(user.errors[:expiration_month]).to include("can't be blank")
    end

    it "is invalid without a expiration_year" do
      user = build(:user, expiration_year: nil)
      user.valid?
      expect(user.errors[:expiration_year]).to include("can't be blank")
    end

    it "is invalid without a security_code" do
      user = build(:user, security_code: nil)
      user.valid?
      expect(user.errors[:security_code]).to include("can't be blank")
    end

    it "is invalid with a security_code that has less than 2 characters " do
      user = build(:user, security_code: "12")
      user.valid?
      expect(user.errors[:security_code][0]).to include("is invalid")
    end

    it "is invalid with a security_code that has more than 5 characters " do
      user = build(:user, security_code: "12345")
      user.valid?
      expect(user.errors[:security_code][0]).to include("is invalid")
    end

    it "is invalid with a security_code includes non-integer characters" do
      user = build(:user, security_code: "12a")
      user.valid?
      expect(user.errors[:security_code][0]).to include("is invalid")
    end

  end
end
