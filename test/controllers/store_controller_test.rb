require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    # Test para contenido usando selectores CSS
    assert_select "li a", minimum: 4
    assert_select 'header img', minimum: 1
    assert_select 'main ul li', 3
    assert_select 'h2', 'MyString'
    assert_select 'div', /\$[,\d]+\.\d\d/     # Price
  end
end
