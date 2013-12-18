ActiveAdmin.register Plan do
  index do
    column :id
    column :name
    column :username do |plan|
      User.find(plan.user_id).username
    end
    column :user_email do |plan|
      User.find(plan.user_id).email
    end
    column :created_at
    column :updated_at
    default_actions
  end
end
