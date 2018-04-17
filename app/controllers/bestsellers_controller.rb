class BestsellersController < ApplicationController
  def index
    list = BestsellerService.new
    @paperbacks = list.paperback
    @hardcovers = list.hardcover
  end

end
