class NewsFeedsController < ApplicationController
	def index
		@activities = PublicActivity::Activity.order(created_at: :desc).where(owner_id: current_user.friend_ids + current_user.inverse_friend_ids, owner_type: "User")
	end
end
