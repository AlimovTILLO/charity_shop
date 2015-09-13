ActiveAdmin.register Item do
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

  batch_action :set_random_foundations do |ids|
    Item.find(ids).each do |item|
      item.update foundation_id: Foundation.all.sample.id
    end
    redirect_to collection_path, notice: 'Done'
  end

  batch_action :set_charity do |ids|
    Item.find(ids).each do |item|
      item.update charity: Item::CHARITIES.sample
    end
    redirect_to collection_path, notice: 'Done'
  end


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
    column :foundation do |item|
      item.foundation.name if item.foundation
    end
    column :price
    column :charity
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
      row :charity
      row :thumbnail do |item|
        image_tag item.thumbnail.thumb
      end
    end
  end

  form do |f|
    f.inputs 'Item Details' do
      f.input :foundation
      f.input :title
      f.input :description
      f.input :price
      f.input :thumbnail
      f.input :charity, as: :select, collection: Item::CHARITIES
    end

    f.actions
  end
end
