class MorgagesController < ApplicationController
	def index
		@morgages = Morgage.all
	end
	
	def show
		@morgage = Morgage.find(params[:id])
	end
	
	def new
		@morgage = Morgage.new
	end

	def edit
		@morgage = Morgage.find(params[:id])
	end

	def create
		@morgage = Morgage.new(morgage_params)

		if @morgage.save
			redirect_to morgage_path
		else
			render 'new'
		end
	end

	def update
		@morgage = Morgage.find(params[:id])

		if @morgage.update(morgage_params)
			redirect_to morgage_path
		else
			render 'edit'
		end
	end

	def destroy
		@morgage = Morgage.find(params[:id])
		@morgage.destroy

		redirect_to morgages_path
	end

	private
	def morgage_params
		params.require(:morgage).permit(:amount, :timeframe_in_years, :annual_interest_rate)
	end
end
