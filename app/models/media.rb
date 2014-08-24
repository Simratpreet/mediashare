class Media < ActiveRecord::Base

	belongs_to :user
	has_attached_file :image, :styles => { :thumb => "200x200>" }
	validates_attachment_content_type :image, :content_type => /\Aimage/
	validates :image, presence: true
end
