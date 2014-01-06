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

  def new
    @plan_template = PlanTemplate.new(:user_id => current_user.id)
  end

  def create
    @plan_template = PlanTemplate.new(params[:plan_template])
    # for now, hide all custom created plans
    @plan_template.public = false

    passage_refs = params[:passage_refs]

    passage_refs.each_line do |passage_ref|
      @plan_template.plan_template_details.build(passage_ref: passage_ref)
    end

    if @plan_template.save
      create_successful
    else
      create_unsuccessful
    end
  end

  protected

  def create_successful
    redirect_to @plan_template, :notice => 'Plan created'
  end

  def create_unsuccessful
    flash.now.alert = 'Plan could not be created'
    render :action => 'new', passage_refs: params[:passage_refs]
  end
end
