require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should create line item" do
    assert_difference("LineItem.count") do
      # No entiendo por que hay error probando este test si no hay problemas accediendo a la instancia products(:ruby)
      puts products(:ruby).id
      post product_line_items_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!
    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'p', "1 \u00D7 Programming Ruby 1.9"
  end
end
