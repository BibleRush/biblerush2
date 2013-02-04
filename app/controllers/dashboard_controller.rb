# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
    @plans = Plan.order('created_at DESC')
  end

  def comment
    pd = PlanDetail.find(params[:id])
    comment = pd.comments.create(comment: params[:comment], user_id: current_user.id)

    redirect_to plan_detail_path(pd)
  end
end
