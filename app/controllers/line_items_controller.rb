class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: :create

  def create
    product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)
    @line_item = @cart.add_product(product)

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
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_to cart_url(@line_item.cart)
    else
      @line_item.destroy
      redirect_to products_url
    end
  end
end
