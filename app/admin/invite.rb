ActiveAdmin.register Invite do
  index do
    column :id
    column :email
    column :avatar do |user|
      EmojiHelper.emojatar(user.avatar)
    end
    column :invited_by do |user|
      User.find(user.invited_by).email
    end
    column :accepted
    column :created_at
    column :updated_at
  end
end
