Rails.application.routes.draw do
  root :to => "activities#index"
  # Routes for the Membership resource:
  # CREATE
  get "/memberships/new", :controller => "memberships", :action => "new"
  post "/create_membership", :controller => "memberships", :action => "create"

  # READ
  get "/memberships", :controller => "memberships", :action => "index"
  get "/memberships/:id", :controller => "memberships", :action => "show"

  # UPDATE
  get "/memberships/:id/edit", :controller => "memberships", :action => "edit"
  post "/update_membership/:id", :controller => "memberships", :action => "update"

  # DELETE
  get "/delete_membership/:id", :controller => "memberships", :action => "destroy"
  #------------------------------

  # Routes for the Group resource:
  # CREATE
  get "/groups/new", :controller => "groups", :action => "new"
  post "/create_group", :controller => "groups", :action => "create"

  # READ
  get "/groups", :controller => "groups", :action => "index"
  get "/groups/:id", :controller => "groups", :action => "show"

  # UPDATE
  get "/groups/:id/edit", :controller => "groups", :action => "edit"
  post "/update_group/:id", :controller => "groups", :action => "update"

  # DELETE
  get "/delete_group/:id", :controller => "groups", :action => "destroy"
  #------------------------------

  # Routes for the Invite resource:
  # CREATE
  get "/invites/new", :controller => "invites", :action => "new"
  post "/create_invite", :controller => "invites", :action => "create"

  # READ
  get "/invites", :controller => "invites", :action => "index"
  get "/invites/:id", :controller => "invites", :action => "show"

  # UPDATE
  get "/invites/:id/edit", :controller => "invites", :action => "edit"
  post "/update_invite/:id", :controller => "invites", :action => "update"

  # DELETE
  get "/delete_invite/:id", :controller => "invites", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  post "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Activity resource:
  # CREATE
  get "/activities/new", :controller => "activities", :action => "new"
  post "/create_activity", :controller => "activities", :action => "create"

  # READ
  get "/activities", :controller => "activities", :action => "index"
  get "/activities/:id", :controller => "activities", :action => "show"

  # UPDATE
  get "/activities/:id/edit", :controller => "activities", :action => "edit"
  post "/update_activity/:id", :controller => "activities", :action => "update"

  # DELETE
  get "/delete_activity/:id", :controller => "activities", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
