# encoding: UTF-8

class PlansController < ApplicationController
  def index
    @plans = current_user.plans
  end

  def show
    @plan = Plan.find(params[:id])
    @plan_details = @plan.plan_details.ordered.includes(:comments)
  end

  def new
    template = PlanTemplate.find(params[:plan_template_id])
    plan = Plan.create_from_template(template:   template,
                                     start_date: DateTime.now.utc,
                                     user:       current_user)
    if plan.save!
      render plan
    else
      error_msg = "doh! something went wrong and we couldn't create your reading plan"
      redirect_to dashboard_home_path, flash: { error: error_msg }
    end
  end
end
