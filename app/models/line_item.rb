class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    return self.product.price * self.quantity
  end
end
