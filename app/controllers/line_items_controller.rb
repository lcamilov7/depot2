class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create destroy]

  def create
    product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_url }
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
      redirect_to root_url
    else
      @line_item.destroy
      if @cart.line_items.empty?
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil

        respond_to do |format|
          format.html { redirect_to root_url, notice: 'Your cart is now empty' }
          format.json { head :no_content }
        end
      else
        redirect_to root_url
      end
    end
  end
end
