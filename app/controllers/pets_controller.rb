class PetsController < ApplicationController
	before_action :authenticate_user_by_token
	before_action :set_pet, only: [:show, :update, :destroy, :update_status]

	# GET /PETS
	def index
		@pets = Pet.all
		render json: @pets, status: 200
	end

	def create
		@pet = Pet.new(pet_params)
		
		@pet.user = current_user
		puts 
		if @pet.save
				render json: @pet, status: 201
		else
				render json: @pet.errors, status: 422
		end
	end

	def show
		render json: @pet, status: 200
	end

	def update
		@pet.update(pet_params)
		if @pet.persisted?
			render json: @pet, status: 200
		else
			render json: @pet.errors, status: 422
		end
	end

	def update_status
		@pet.update_attribute :status, "Adoptado"
		if @pet.persisted?
			render json: @pet, status: 200
		else
			render json: @pet.errors, status: 422
		end
	end

	def destroy
		if @pet.user_id == current_user.id
			if @pet.destroy
				head :no_content
			else
				render json: @pet.errors, status: 422
			end
		else
			response = { message: "You don't have permission for this action!" }
			render json: response, status: 401
		end
	end

	private

	def set_pet
		@pet = Pet.find(params[:id])
	end

	def pet_params
		params.require(:pet).permit!
	end
end