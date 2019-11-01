class MarketController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  def homepage
  end

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  # POST /card
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    @card.save
    redirect_to market_show_path(@card)
  end
    
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :image_url, :condition_id, :clan_id, :listing_id)
  end

end