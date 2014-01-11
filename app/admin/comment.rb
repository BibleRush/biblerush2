ActiveAdmin.register Comment, :as => 'PlanComment' do
  index do
    column :id
    column 'Plan ID', :commentable_id do |comment|
      pd = PlanDetail.find(comment.commentable_id)
      pd.plan.id
    end
    column :comment
    column :user do |comment|
      user = User.find(comment.user_id)
      "#{user.username} -  #{user.email}"
    end
    column :created_at
  end
end
