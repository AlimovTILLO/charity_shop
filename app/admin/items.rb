ActiveAdmin.register Item do
  actions :index, :show, :delete

  permit_params :title,
                :description,
                :price,
                :thumbnail

  filter :user_email_equals
  filter :title
  filter :description
  filter :price
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :user do |item|
      link_to item.user.email, admin_user_path(id: item.user_id)
    end
    column :thumbnail do |item|
      link_to image_tag(item.thumbnail.small, width: 50, height: 50),
              item.thumbnail.url
    end
    column :title
    column :description do |item|
      item.description.truncate 100
    end
    column :price
    actions
  end

  show do
    attributes_table do
      row :user do |item|
        link_to item.user.email, admin_user_path(id: item.user_id)
      end
      row :title
      row :description
      row :price
      row :thumbnail do |item|
        image_tag item.thumbnail.thumb
      end
    end
  end
end
