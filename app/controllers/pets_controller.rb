class PetsController < ApplicationController
    before_action :authenticate_user_by_token
    # GET /PETS
    def index
        @pets = Pet.all
        render json: @pets, status: 200
    end
end