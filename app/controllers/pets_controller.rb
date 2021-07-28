class PetsController < ApplicationController
    
    # GET /PETS
    def index
        @pets = Pet.all
        json_response(@pets)
    end
end