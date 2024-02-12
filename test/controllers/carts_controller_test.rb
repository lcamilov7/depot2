require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_url(carts(:one))
    assert_response :success
  end

  test "should destroy cart" do
    # Para testear que el cart se elimine correctamente primero debemos crear un cart, el cart se genera automaticamente cuando se crea un line_item
    puts products(:ruby).id
    post product_line_items_url, params: { product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) do
      delete cart_delete_url(@cart)
    end
    assert_redircted_to root_url
  end
end
