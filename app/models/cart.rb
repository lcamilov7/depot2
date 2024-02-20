class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    # Tiene que ser find_by porque el find no devuelve ni false ni nil
    current_item = LineItem.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(cart: self, product: product)
    end
    return current_item
  end

  def total_price
    self.line_items.sum { |item| item.total_price }
  end
end
