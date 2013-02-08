class PlanDetailsController < ApplicationController
  def show
    @plan_detail = PlanDetail.find(params[:id])
    @comments = @plan_detail.comments.includes(:user)
    @comment = @plan_detail.comments.new
  end
end
