class FriendshipsController < ApplicationController

  def index
    @inverse_friendships = current_user.inverse_friendships.not_rejected
    @friends = current_user.friendships.not_rejected
    rejected_friendships = current_user.friendships.rejected 
    pending_friendships = current_user.friendships.pending 
    approved_friendships = current_user.friendships.approved 
    inverse_approved_friendships = current_user.inverse_friendships.approved
    inverse_pending_friendships = current_user.inverse_friendships.pending
    inverse_rejected_friendships = current_user.inverse_friendships.rejected
    @non_friends = User.where.not(id: approved_friendships.pluck(:friend_id) + [current_user.id]  +  pending_friendships.pluck(:friend_id) +  rejected_friendships.pluck(:friend_id) + inverse_approved_friendships.pluck(:friend_id) + inverse_pending_friendships.pluck(:friend_id) + inverse_rejected_friendships.pluck(:friend_id))
  end 

  def create
    @friendship = current_user.friendships.build(friendship_params)
    if @friendship.save
      flash[:notice] = "Added Friend"
      redirect_to friendships_path

    else
      flash[:error] = "Not able to add as a friend"
    end

  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end

  def accept
    @friendship = current_user.inverse_friendships.where(id: params[:id]).first
    @friendship.update(status: "approved")
    redirect_to friendships_path 
  end

  def reject
    @friendship = current_user.inverse_friendships.where(id: params[:id]).first
    @friendship.update(status: "rejected")
    redirect_to friendships_path
  end

  private
  def friendship_params
    params.permit(:friend_id)
  end
end
