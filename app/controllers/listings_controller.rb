class ListingsController < ApplicationController
    def index
        @cards = Card.where("sold = false")
    end

    def list
        @listing = Listing.new
    end
    
    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id
        @listing.save
        redirect_to market_card_new_path
    end
    
    def edit
        @card = Card.find(params[:id])
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

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @listing.title,
                description: @listing.description,
                amount: @listing.price * 100,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    listing_id: @listing.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id
    end

    private

    def card_params
        card_params = params.require(:card).permit(:name, :image_url, :clan_id, :condition_id, :listing_id, :picture, :sold )
    end 
    def listing_params
        listing_params = params.require(:listing).permit(:title, :price, :user_id )
    end

end
