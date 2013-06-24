class PlanTemplatesController < ApplicationController
  def index
    @plan_templates = PlanTemplate.all
  end

  def show
    @plan_template = PlanTemplate.find(params[:id])
    @plan_template_details = @plan_template.plan_template_details
  end

  def start_date
    @plan_template = PlanTemplate.find(params[:id])
    @plan_days = PlanTemplateDetail.where(:plan_template_id => @plan_template).count
  end
end
