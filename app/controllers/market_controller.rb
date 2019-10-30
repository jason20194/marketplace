class MarketController < ApplicationController
  def homepage
  end

  def index
    @cards = Card.all
  end
end
