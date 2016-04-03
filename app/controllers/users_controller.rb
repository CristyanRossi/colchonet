class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user,
						notice: 'Cadastro criado com sucesso!'
		else
			render action: :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:full_name, :location, :email, :password, :bio)
	end
end