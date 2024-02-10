module StoreIndexCounter
  private

  def set_counter
    if session[:counter].present?
      session[:counter] += 1
    else
      session[:counter] = 0
    end
  end
end
