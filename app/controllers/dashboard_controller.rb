# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
  end
end
