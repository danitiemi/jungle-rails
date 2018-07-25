require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "click the 'Add to Cart' button on the home page their cart increases by one" do
    # ACT
    visit root_path
    first('article.product').find_link('Add').click

    # DEBUG
    save_screenshot

    # VERIFY
    # set our first expectation of content we expect the user to see on the page
    expect(page).to have_link('My Cart (1)')
  end
end
