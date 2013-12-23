class InvitesController < ApplicationController
  before_filter :find_plan

  def new
    @invite = @plan.invites.build
    @invite.invited_by = current_user.id
    @pending_invites = Invite.pending_invites_for(@plan.id)
    @accepted_invites = Invite.accepted_invites_for(@plan.id)
  end

  def create
    authorize! :read, @plan

    @invite = @plan.invites.build(params[:invite])

    if @invite.save
      create_successful
      send_invite_email(@invite)
    else
      create_failed
    end
  end

  private

  def create_successful
    notice = "Invited #{@invite.email} to '#{@plan.name}' reading plan."
    redirect_to new_plan_invite_path(@plan), :notice => notice
  end

  def send_invite_email(invite)
    UserMailer.invite_to_plan_email(invite).deliver
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
