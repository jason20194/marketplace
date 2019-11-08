class PaymentsController < ApplicationController
    def success
        @listing = Listing.find(params[:listingId])
        @listing.cards.update_all(sold: true)
    end
end