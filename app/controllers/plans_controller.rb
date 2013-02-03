# encoding: UTF-8

class PlansController < ApplicationController
  def index
    @plans = current_user.plans
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    template = PlanTemplate.find(params[:plan_template_id])
    plan = Plan.create_from_template(template:   template,
                                     start_date: DateTime.now.utc,
                                     user:       current_user)
    if plan.save!
      redirect_to plan
    else
      flash[:error] = 'doh! something went wrong'
      redirect_to dashboard_home_path
    end
  end
end
