class Product < ApplicationRecord
  # Associations
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  # Validations
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :title, length: { minimum: 5, message: "Should be 5 chars at least" }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      # Los errores pueden estar asociados a un atributo del producto (:title), (:price)
      # etc pero en este caso tambien puede estar asociado al objeto base (:base)
      errors.add(:base, 'Line Items present for this product')
      throw :abort
    end
  end

end
