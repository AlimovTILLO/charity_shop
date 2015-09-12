ActiveAdmin.register Foundation do
  permit_params :name,
                :description,
                :link,
                :logo,
                :legal_status,
                :created_at,
                :updated_at

  filter :name
  filter :description
  filter :link
  filter :legal_status
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :logo do |foundation|
      link_to image_tag(foundation.logo.thumb, width: 50, height: 50),
              admin_foundation_path(foundation.id)
    end
    column :name
    column :description
    column :legal_status
    column :link do |foundation|
      link_to foundation.link
    end
    actions
  end

  form do |f|
    f.inputs 'Foundation Details' do
      f.input :name
      f.input :description
      f.input :legal_status
      f.input :link
      f.input :logo, hint: (f.object.logo.present?  ? image_tag(f.object.logo.thumb) : '')
    end

    f.actions
  end
end
