class StoreController < ApplicationController
  include StoreIndexCounter
  before_action :set_counter, only: :index
  
  def index
    @products = Product.order(:title)
  end
end
