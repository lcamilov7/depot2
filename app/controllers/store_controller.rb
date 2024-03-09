class StoreController < ApplicationController
  include StoreIndexCounter
  before_action :set_counter, only: :index
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    # Organizamos para que los line items esten siempre en el orden en el que van siendo añadidos al carrito
    @line_items = @cart.line_items.order('id ASC')
  end
end
