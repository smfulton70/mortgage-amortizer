class HousesController < ApplicationController
	def index
		@houses = House.all
	end

	def show
		@house = House.find(params[:id])
	end

	def new
		@house = House.new
	end

	def edit
		@house = House.find(params[:id])
	end

	def create
		@house = House.new(house_params)

		if @house.save
			redirect_to house_path(@house)
		else
			render 'new'
		end
	end

	def updates
		@house = House.update(house_params)

		if @house.save
			redirect_to houses_path
		else
			render 'edit'
		end
	end

	def destroy
		@house = House.find(params[:id])
		@house.destroy

		redirect_to houses_path
	end

	private
		def house_params
			params.require(:house).permit(:street_address, :city, :state, :price)
		end

end
