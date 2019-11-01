class CardsController < ApplicationController
    def edit
        @card = Card.find(params[:id])
    end

    def update
        @card = Card.find(params[:id])
        @card.update
        redirect_to market_index_path
    end

    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        redirect_to market_index_path
    end
end