# encoding: UTF-8

class PlansController < ApplicationController
  load_and_authorize_resource

  def index
    @plans = current_user.plans
  end

  def show
    @plan = Plan.find(params[:id])
    @plan_details = @plan.plan_details.ordered.includes(:comments)
    @members = Array(@plan.creator) + @plan.users
    @pending_invites = Invite.where(:plan_id => @plan.id, :accepted => false)
    @emoji_list = %w(bowtie smile laughing grin wink sleeping worried confused
                    sweat sob scream angry smiling_imp innocent yellow_heart
                    heart broken_heart sparkles star2 boom exclamation question
                    zzz dash sweat_drops musical_note fire thumbsup -1 ok_hand
                    punch v raised_hand point_left point_right  pray
                    clap muscle runner couple family no_good raising_hand baby
                    cop angel japanese_ogre skull feet speech_balloon thought_balloon
                    trollface sunny umbrella cloud snowflake zap ocean cat dog
                    hamster rabbit frog koala horse sheep turtle evergreen_tree
                    gift movie_camera camera computer tv phone watch)
  end

  def new
    template = PlanTemplate.find(params[:plan_template_id])
    plan = Plan.create_from_template(template:   template,
                                     start_date: DateTime.parse(params[:start_date]),
                                     user:       current_user)
    if plan.save!
      redirect_to plan, notice: 'new reading plan created'
    else
      error_msg = "doh! something went wrong and we couldn't create your reading plan"
      redirect_to dashboard_home_path, flash: { error: error_msg }
    end
  end
end
