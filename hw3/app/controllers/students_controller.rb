class StudentsController < ApplicationController
	def new
		@name_place_holder = 'John'
		@id_place_holder = "12345678"
		@major_place_holde = "EECS"
	end

	def show
		@name = params[:name]
		@id = params[:id]
		@major = params[:major]
	end
end