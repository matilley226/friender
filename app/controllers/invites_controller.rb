class InvitesController < ApplicationController
  def index
    @invites = Invite.all

    render("invites/index.html.erb")
  end

  def show
    @invite = Invite.find(params[:id])

    render("invites/show.html.erb")
  end

  def new
    @invite = Invite.new

    render("invites/new.html.erb")
  end

  def create
    @invite = Invite.new

    @invite.activity_id = params[:activity_id]
    @invite.invitee_id = params[:invitee_id]
    @invite.attend_status = params[:attend_status]

    save_status = @invite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/invites/new", "/create_invite"
        redirect_to("/invites")
      else
        redirect_back(:fallback_location => "/", :notice => "Invite created successfully.")
      end
    else
      render("invites/new.html.erb")
    end
  end

  def edit
    @invite = Invite.find(params[:id])

    render("invites/edit.html.erb")
  end

  def update
    @invite = Invite.find(params[:id])

    @invite.activity_id = params[:activity_id]
    @invite.invitee_id = params[:invitee_id]
    @invite.attend_status = params[:attend_status]

    save_status = @invite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/invites/#{@invite.id}/edit", "/update_invite"
        redirect_to("/invites/#{@invite.id}", :notice => "Invite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Invite updated successfully.")
      end
    else
      render("invites/edit.html.erb")
    end
  end

  def destroy
    @invite = Invite.find(params[:id])

    @invite.destroy

    if URI(request.referer).path == "/invites/#{@invite.id}"
      redirect_to("/", :notice => "Invite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Invite deleted.")
    end
  end
end
