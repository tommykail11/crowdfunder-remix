class ProjectsController < ApplicationController
  def index
    @projects = Project.order("projects.created_at DESC").page(params[:page]).per(8)
  end

  def show
    @project = Project.find(params[:id])
    @pledge  = @project.pledges.build
  end

  protected

  def nav_state
    @nav = :projects
  end
  
end

