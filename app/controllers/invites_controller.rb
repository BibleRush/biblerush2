class InvitesController < ApplicationController
  before_filter :find_plan

  def new
    @invite = @plan.invites.build
    @pending_invites = Invite.where(:plan_id => @plan.id, :accepted => false).order('created_at DESC')
    @accepted_invites = Invite.where(:plan_id => @plan.id, :accepted => true).order('updated_at DESC')
  end

  def create
    authorize! :read, @plan

    @invite = @plan.invites.build(params[:invite])

    if @invite.save
      create_successful
    else
      create_failed
    end
  end

  private

  def create_successful
    notice = "Invited #{@invite.email} to '#{@plan.name}' reading plan."
    redirect_to new_plan_invite_path(@plan), :notice => notice
  end

  def create_failed
    flash.now.alert = 'failure'
    render :action => 'new'
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
    authorize! :read, @plan
  end
end
