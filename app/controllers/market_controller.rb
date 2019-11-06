class MarketController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :sell_card]
  def homepage
  end

  def about
  end

  def buyorsell
  end
  
  def sell_card
    @card.sold = true
    respond_to do |format|
      if @card.save
        format.html { redirect_to market_sold_path, notice: 'card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def sold 
    @cards = Card.all
  end

  def contact
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

  def update
    respond_to do |format|
      if @recipe.update(card_params)
        format.html { redirect_to @card, notice: 'card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :image_url, :condition_id, :clan_id, :listing_id,:picture, :sold)
  end

end