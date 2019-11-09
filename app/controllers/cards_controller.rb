class CardsController < ApplicationController
    def index
        @cards = Card.all
    end
    
    def edit
        @card = Card.find(params[:id])
        unless current_user == @card.listing.user
            redirect_to listings_index_path, notice: "You cannot edit this listing" and return
        
    end

    end

    def update
        card_params = params.require(:card).permit(:name, :image_url, :clan_id, :condition_id, :listing_id, :picture )
        @card = Card.find(params[:id])
        @card.update(card_params)
        redirect_to listings_index_path
    end

    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        redirect_to listings_index_path
    end
    
    def show
    end

    private

    def card_params
        card_params = params.require(:card).permit(:name, :image_url, :clan_id, :condition_id, :listing_id, :picture )
    end 

end