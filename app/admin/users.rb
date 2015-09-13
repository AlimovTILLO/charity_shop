ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :balance

  batch_action :set_random_balance do |ids|
    User.find(ids).each do |user|
      user.update balance: rand(500...1000)
    end
    redirect_to collection_path, notice: 'Done'
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :balance
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :balance

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :balance
    end

    f.actions
  end
end
