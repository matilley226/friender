class ActivitiesController < ApplicationController
  before_action :current_user_must_be_activity_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_activity_user
    activity = Activity.find(params[:id])

    unless current_user == activity.proposer
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @activities = Activity.all
    @location_hash = Gmaps4rails.build_markers(@activities.where.not(:address_latitude => nil)) do |activity, marker|
      marker.lat activity.address_latitude
      marker.lng activity.address_longitude
      marker.infowindow "<h5><a href='/activities/#{activity.id}'>#{activity.name}</a></h5><small>#{activity.address_formatted_address}</small>"
    end

    render("activities/index.html.erb")
  end

  def show
    @invite = Invite.new
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.category_id = params[:category_id]
    @activity.meet_time = params[:meet_time]
    @activity.proposer_id = params[:proposer_id]
    @activity.visual = params[:visual]
    @activity.duration = params[:duration]
    @activity.cost_level = params[:cost_level]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/new", "/create_activity"
        redirect_to("/activities")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity created successfully.")
      end
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.category_id = params[:category_id]
    @activity.meet_time = params[:meet_time]
    @activity.proposer_id = params[:proposer_id]
    @activity.visual = params[:visual]
    @activity.duration = params[:duration]
    @activity.cost_level = params[:cost_level]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/#{@activity.id}/edit", "/update_activity"
        redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity updated successfully.")
      end
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Activity deleted.")
    end
  end
end
