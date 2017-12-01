class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all

    render("memberships/index.html.erb")
  end

  def show
    @membership = Membership.find(params[:id])

    render("memberships/show.html.erb")
  end

  def new
    @membership = Membership.new

    render("memberships/new.html.erb")
  end

  def create
    @membership = Membership.new

    @membership.group_id = params[:group_id]
    @membership.member_id = params[:member_id]

    save_status = @membership.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/memberships/new", "/create_membership"
        redirect_to("/memberships")
      else
        redirect_back(:fallback_location => "/", :notice => "Membership created successfully.")
      end
    else
      render("memberships/new.html.erb")
    end
  end

  def edit
    @membership = Membership.find(params[:id])

    render("memberships/edit.html.erb")
  end

  def update
    @membership = Membership.find(params[:id])

    @membership.group_id = params[:group_id]
    @membership.member_id = params[:member_id]

    save_status = @membership.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/memberships/#{@membership.id}/edit", "/update_membership"
        redirect_to("/memberships/#{@membership.id}", :notice => "Membership updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Membership updated successfully.")
      end
    else
      render("memberships/edit.html.erb")
    end
  end

  def destroy
    @membership = Membership.find(params[:id])

    @membership.destroy

    if URI(request.referer).path == "/memberships/#{@membership.id}"
      redirect_to("/", :notice => "Membership deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Membership deleted.")
    end
  end
end
