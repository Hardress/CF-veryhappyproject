require 'rails_helper'

describe Order do

  let(:product) {

    Product.create!(
      name: "Test order",
      description: "test product",
      image_url: "bike1.jpg",
    )
  }

  let(:user) {User.create!(email: "test@gmail.com", password: "password")}

  it "is a valid order" do
    expect(Order.new( user: user, product: product, total: 100)).to be_valid
  end

  it "is not valid without a user" do
    expect(Order.new( product: product, total: 100)).not_to be_valid
  end

  it "is not valid without product" do
    expect(Order.new( user: user, total: 100)).not_to be_valid
  end
end