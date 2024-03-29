class CartsController < ApplicationController
  before_action :set_cart, only: %i[destroy] # show
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # def show
  #   if @cart.id != session[:cart_id]
  #     redirect_to root_path, notice: 'Unauthorized cart'
  #   else
  #     @line_items = @cart.line_items.order('id ASC')
  #   end
  # end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your cart is now empty' }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: 'Error: Invalid cart'
  end
end
