require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # describe 'Associations' do
  #   it { should belong_to(:category) }
  # end
  
  describe 'Validations' do
    let(:category) { Category.create(:name => 'test')}
    let(:product) { Product.create(
      name: 'Test product',
      price: 13.99,
      quantity: 3,
      category: category
    )}

    it 'is valid with valid four fields successfully saved' do
      expect(product).to be_valid
    end
    
    it 'is not valid without a name' do
      product.name = nil
      # expect(product).to_not be_valid
      expect(product.errors.full_messages)
    end 

    it 'is not valid without a price' do
      product.price_cents = nil
      expect(product.errors.full_messages)
    end

    it 'is not valid without a quantity' do
      product.quantity = nil
      expect(product.errors.full_messages)
    end

    it 'is not valid without a category' do
      product.category = nil
      expect(product.errors.full_messages)
    end
      
  end
end
