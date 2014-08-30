class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  
  scope :approved, -> {where(status: 'approved')}  
  scope :pending, -> {where(status: 'pending')}
  scope :rejected, -> {where(status: 'rejected')}
  scope :not_rejected, -> {where.not(status:'rejected')}
end
