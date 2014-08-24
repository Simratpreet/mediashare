module UsersHelper
  def render_media_object(media)
    if media.image?
      image_tag media.attachment.url(:thumb)
    elsif media.video?
      video_tag media.attachment, controls: true, autobuffer: true, class: 'video'
    else
      link_to media.name, media.attachment.url
    end
  end
end
