class UsersController < ApplicationController
  
skip_before_action(:force_user_sign_in, { :only => [:index] })

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    @total_followers = @the_user.received_follow_requests.where({ :status => "accepted"}).count
    @total_following = @the_user.sent_follow_requests.where({ :status => "accepted"}).count

    render({ :template => "users/show.html.erb" })
  end

end