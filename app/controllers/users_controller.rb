class UsersController < ApplicationController
	before_action :authenticate_user!


	def index
		@media = current_user.media
		@user = User.all
	end

end
