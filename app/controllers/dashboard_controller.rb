class DashboardController < ApplicationController
  def index
    if current_user.uid != nil
      @book_queue_service = BookQueueService.new(current_user)
      @book_info = @book_queue_service.get_book_queue
    else
      get_user_info
      @book_queue_service = BookQueueService.new(current_user)
      @book_info = @book_queue_service.get_book_queue
    end

    if params[:search].present?
      @bookstore = Bookstore.near(params[:search], 50, :order => :distance)
    else
      @bookstore = Bookstore.all
    end
  end
end
