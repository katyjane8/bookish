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
  end
end
