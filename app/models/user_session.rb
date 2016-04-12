class UserSession
	include ActiveModel::Model

	attr_accessor :email, :password
	validates_presence_of :email, :password

	def new
		@user_session = UserSession.new(session)
	end

	def create
		@user_session = UseSession.new(session,
											params[:user_session])
		if @user_session.authenticate!
			redirect_to root_path, notice: t('flash.notice.signed_in')
		else
			render :new
		end
	end

	def current_user
		User.find(@session[:user_id] )
	end

	def user_signed_in?
		@session[:user_id].present?
	end

	def initialize(session, attributes={})
		@session = session
		@email = attributes[:email]
		@password = attributes[:password]
	end

	def authenticate!
		user = User.authenticate(@email, @password)

		if user.present?
			store(user)
		else
			errors.add(:base, :invalid_login)
			false
		end
	end

	def store(user)
		@session[:user_id] = user.id
	end

	def destroy
		@session[:user_id ] = nil
	end

end

