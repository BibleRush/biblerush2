# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
    @plans = current_user.plans.order('created_at DESC')
  end

  def comment
    pd = PlanDetail.find(params[:id])
    pd.comments.create(:comment => "comment made on #{DateTime.now.utc.strftime('%b %e, %l:%M %p')}")
    redirect_to plan_path(pd.plan)
  end
end
