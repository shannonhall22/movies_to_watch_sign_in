class WatchesController < ApplicationController

  before_action :check_if_owner_or_admin, :only => [:edit, :update, :destroy]

  def check_if_owner_or_admin
    watch = Watch.find(params[:id])
    unless (watch.user_id == current_user.id) || current_user.admin
      redirect_to watches_url, :notice => "You must be the watchee to do that!"
    end
  end

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new
    @watch.user_id = params[:user_id]
    @watch.movie_id = params[:movie_id]
    @watch.movie_title = params[:movie_title]

    if @watch.save
      redirect_to movies_url, :notice => "Watch list created successfully."
    else
      render 'new'
    end
  end

  def edit
    @watch = Watch.find(params[:id])
  end

  def update
    @watch = Watch.find(params[:id])

    @watch.user_id = params[:user_id]
    @watch.movie_id = params[:movie_id]
    @watch.movie_title = params[:movie_title]

    if @watch.save
      redirect_to movie_url(@watch.id), :notice => "Watch list updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @watch = Watch.find(params[:id])

    @watch.destroy

    redirect_to movies_url, :notice => "Watch list deleted."
  end
end
