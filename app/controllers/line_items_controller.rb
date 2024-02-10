class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: :create

  def create
    product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)
    @line_item = LineItem.new(cart: @cart, product: product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_url(@line_item.cart), notice: 'Line item was succesfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    session[:counter] = 0
  end

  def destroy
  end
end
