require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should create line item" do
    assert_difference("LineItem.count") do
      puts products(:ruby).id
      post product_line_items_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!
    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'p', 'Programming Ruby 1.9'
  end
end
