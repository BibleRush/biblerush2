ActiveAdmin.register Invite do
  index do
    column :id
    column :email
    column :avatar do |user|
      EmojiHelper.emojatar(user.avatar)
    end
    column :invited_by
    column :accepted
    column :created_at
    column :updated_at
  end
end
