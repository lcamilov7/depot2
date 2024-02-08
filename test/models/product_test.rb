require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "products attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "My book", description: "yyy", image_url: image_url, price: 1)
  end

  test "image_url format" do
    ok = %w[fred.gif fred.jpg fred.png FRED.JPG Fred.Jpg http://abcds/xhxch/tr/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]

    ok.each do |url|
      assert new_product(url).valid?, "#{url} must be valid"
    end

    bad.each do |url|
      assert new_product(url).invalid?, "#{url} must be invalid"
    end
  end

  test "product invalid without unique title" do
    product = Product.new(title: products(:ruby).title, description: "yyy", image_url: "zzz.jpg", price: 1)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product title must be 5 characters at least" do
    product = Product.new(title: "char", description: "yyy", image_url: "zzz.jpg", price: 1)
    assert product.invalid?
    assert_equal ["is too short (minimum is 5 characters)"], product.errors[:title]

    product.title = "chars"
    assert product.valid?
  end
end
