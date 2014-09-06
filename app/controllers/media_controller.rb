class MediaController < ApplicationController
	def new
		@media = current_user.media.build
	end

	def create
		@media = current_user.media.build(media_params)
		if(@media.save)
			redirect_to root_path
		else
			render :new
		end

	end
	def show
		load_media
		render :show 
	end
	def edit
		load_media
	end

	def update
		load_media
		if(@media.update_attributes(media_params))
			redirect_to root_path
		else
			render :edit
		end		
	end

	def destroy
		load_media
		@media.destroy
		redirect_to root_path
	end
private
	
	def media_params
		params.require(:media).permit(:attachment, :name)
	end

	def load_media
		@media = Media.where(id: params[:id]).first
	end
end
