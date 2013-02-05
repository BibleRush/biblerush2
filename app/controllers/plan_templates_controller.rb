class PlanTemplatesController < ApplicationController
  def show
    @plan_template = PlanTemplate.find(params[:id])
    @plan_template_details = @plan_template.plan_template_details
  end
end
