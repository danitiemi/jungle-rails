require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "From the home page they can go to the product detail with a click" do
    # ACT
    visit root_path
    # first('article.product').find('image_tag.product.image').click
    find(".actions", match: :first).click_link('Details')
    # DEBUG
    save_screenshot

    # VERIFY
    # set our first expectation of content we expect the user to see on the page
    expect(page).to have_css '.product-detail'

  end

end
