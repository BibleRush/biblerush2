# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
    @plans = Plan.order('created_at DESC')
  end

  def comment
    pd = PlanDetail.find(params[:plan_detail_id])

    # only logged in users can comment
    unless user_signed_in?
      message = "Please <a href='#{new_user_session_path}'>sign in</a> to comment."
      redirect_to(plan_detail_path(pd), flash: { info: message }) and return
    end

    comment = pd.comments.new(comment: params[:comment][:comment], user_id: current_user.id)

    if comment.save
      flash[:notice] = 'comment added'
    else
      flash[:error] = 'comment could not be added'
    end

    redirect_to plan_detail_path(pd)
  end
end
