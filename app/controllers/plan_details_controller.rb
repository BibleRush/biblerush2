class PlanDetailsController < ApplicationController
  def show
    @plan_detail = PlanDetail.find(params[:id])
    @comments = @plan_detail.comments.includes(:user)
    @new_comment = @plan_detail.comments.new
  end
end
