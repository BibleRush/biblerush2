class PlanDetailsController < ApplicationController
  def show
    @plan_detail = PlanDetail.find(params[:id])
    @comments = @plan_detail.comments
  end
end
