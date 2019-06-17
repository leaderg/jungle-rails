require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it 'should not be able to be created without a name' do   #
        @product = Product.create(name: nil, description: "Test Description", category_id: 2, quantity: 31, price: 65.93)

        expect(@product).to_not be_valid
      end

      it 'should not be able to be created without a price' do   #
        @product = Product.create(name: "Test Product", price: nil, description: "Test Description", category_id: 2, quantity: 31)

        expect(@product).to_not be_valid
      end

      it 'should not be able to be created without a quantity' do   #
        @product = Product.create(name: "Test Product", quantity: nil, description: "Test Description", category_id: 2, price: 65.93)

        expect(@product).to_not be_valid
      end

      it 'should not be able to be created without a category' do   #
        @product = Product.create(name: "Test Product", category: nil, description: "Test Description", quantity: 31, price: 65.93)

        expect(@product).to_not be_valid
      end

  end
end