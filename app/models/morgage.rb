class Morgage < ApplicationRecord
	belongs_to :house

	attr_accessor :monthly_payment, :monthly_interest, :monthly_principal, :cumulative_interest, :remaining_principal
		
	validates :amount, presence: true
	validates :annual_interest_rate, presence: true
	validates :timeframe_in_years, presence: true

	

	def monthly_payment
		@monthly_payment = (amount * (annual_interest_rate.to_f/1200) * (1 + annual_interest_rate.to_f/1200)**(timeframe_in_years * 12) / ((1 + annual_interest_rate.to_f/1200)**(timeframe_in_years * 12) - 1)).round(2)
	end

	def get_monthly_interest
		@monthly_interest = (!@remaining_principal ? (amount * (annual_interest_rate.to_f/1200)).round(2) : (@remaining_principal * (annual_interest_rate.to_f/1200)).round(2))
	end

	def get_monthly_principal
		@monthly_principal = (monthly_payment - @monthly_interest).round(2)
	end

	def get_cumulative_interest
		if !@cumulative_interest
			@cumulative_interest = @monthly_interest
		else
			@cumulative_interest += @monthly_interest
		end
		@cumulative_interest.round(2)
	end

	def get_remaining_principal
		if !@remaining_principal
			@remaining_principal = amount - @monthly_principal
		else 
			@remaining_principal -= @monthly_principal
		end
		@remaining_principal.round(2)
	end	
end

	

	

