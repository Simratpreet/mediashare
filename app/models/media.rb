class Media < ActiveRecord::Base
  belongs_to :user
  validates :attachment, presence: true
  validates :name,presence: true
  has_attached_file :attachment, :styles => { :thumb => "200x200>" }
  validates_attachment_content_type :attachment, :content_type => [/image/, /application/, /video/]
end
