# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
    @plans = current_user.plans.order('created_at DESC')
  end

  def comment
    pd = PlanDetail.find(params[:id])
    pd.comments.create(comment: params[:comment])
    redirect_to plan_detail_path(pd)
  end
end
