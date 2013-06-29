class PlanDetailsController < ApplicationController
  def show
    @plan_detail = PlanDetail.find(params[:id])
    @comments = @plan_detail.comments.includes(:user)
    @comment = @plan_detail.comments.new
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
end
