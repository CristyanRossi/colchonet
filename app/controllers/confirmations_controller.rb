class ConfirmationsController < ApplicationController
	def show
		user = User.find_by(confirmation_token: params[:token])

		if user.present?
			user.confirm!
			redirect_to user,
				notice: I18n.t('confirmations.sucesss')
		else
			redirect_To root_path
		end
	 end
end