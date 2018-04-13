class DashboardController < ApplicationController
  def index
    if current_user
      @book_info = token_generator
    end
  end
end
