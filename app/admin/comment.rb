ActiveAdmin.register Comment, :as => 'PlanComment' do
  index do
    column :id
    column 'Plan ID', :commentable_id
    column :comment
    column :user do |comment|
      user = User.find(comment.user_id)
      "#{user.username} -  #{user.email}"
    end
    column :created_at
  end
end
