class Media < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model) { controller.current_user }

  DOCUMENT_FORMATS = %w(application/pdf text/plain text/html)
  AUDIO_FORMATS    = %w(audio/ogg application/ogg audio/mpeg audio/mp3 audio/x-m4-a)
  IMAGE_FORMATS    = %w(image/jpeg image/gif image/png)
  VIDEO_FORMATS    = %w(video/mp4 video/x-flv)

  belongs_to :user
  validates :attachment, presence: true
  validates :name,presence: true
  has_attached_file :attachment, styles: { thumb: '200x200>', medium: '400x400', large: '600x600' }
  
  validates_attachment_content_type :attachment, :content_type => IMAGE_FORMATS + DOCUMENT_FORMATS + AUDIO_FORMATS + VIDEO_FORMATS

  before_post_process :skip_for_audio, :skip_for_documents, :skip_for_video
  
  def image?
    IMAGE_FORMATS.include?(attachment_content_type)
  end

  def video?
    VIDEO_FORMATS.include?(attachment_content_type)
  end

  private
    def skip_for_audio
      AUDIO_FORMATS.exclude?(attachment_content_type)
    end

    def skip_for_documents
      DOCUMENT_FORMATS.exclude?(attachment_content_type)
    end

    def skip_for_video
      VIDEO_FORMATS.exclude?(attachment_content_type)
    end
end
