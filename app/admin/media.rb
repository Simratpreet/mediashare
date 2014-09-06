ActiveAdmin.register Media do
  permit_params :name, :attachment, :approved

  member_action :approve, method: :patch do
    media = Media.where(id: params[:id]).first
    media.update_column(:approved, true)
    redirect_to admin_media_index_path, notice: "Media Approved successfully!"
  end

  member_action :reject, method: :patch do
    media = Media.where(id: params[:id]).first
    media.update_column(:approved, false)
    redirect_to admin_media_index_path, notice: "Media Rejected successfully!"
  end

  index do
    column :id
    column :name
    column :attachment_file_name
    column :attachment_file_size
    column :approved
    column :media_url do |media|
      link_to(media.name, media.attachment.url)
    end
    actions(default: true) do |media|
      if media.approved?
        link_to("Reject!", reject_admin_media_path(media), method: :patch)
      else
        link_to("Approve!", approve_admin_media_path(media), method: :patch)
      end
    end
  end
end
