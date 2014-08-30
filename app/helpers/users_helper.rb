module UsersHelper
  def render_media_object(media)
    if media.image?
      image_tag media.attachment.url(:thumb), class: "media"
    elsif media.video?
      video_tag [media.attachment.url], controls: true, autobuffer: true, class: "media"
    else
      audio_tag [media.attachment.url],  autoplay: false, controls: true, class: "audio"
    end
  end
end
