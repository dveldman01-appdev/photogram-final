class FollowRequestsController < ApplicationController
  def index
    matching_followrequests = FollowRequest.all

    @list_of_followrequests = matching_followrequests.order({ :created_at => :desc })

    render({ :template => "follow_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_followrequests = FollowRequest.where({ :id => the_id })

    @the_followrequest = matching_followrequests.at(0)

    render({ :template => "follow_requests/show.html.erb" })
  end

  def create
    the_request_recipient_id = params.fetch("query_recipient_id")
    the_recipient = User.where({ :id => the_request_recipient_id }).at(0)
        
    @the_new_request = FollowRequest.new
    @the_new_request.recipient_id = the_request_recipient_id
    @the_new_request.sender_id = session.fetch(:user_id)

    # When a FollowRequest is created you need to check if the recipient of the request is a private User. If they are private, the status column of the FollowRequest should be set to "pending". If they are not private the status should be set to "accepted".
    if the_recipient.private == TRUE
      @the_new_request.status = "pending"
    else
      @the_new_request.status = "accepted"
    end
    
    if @the_new_request.valid?
      @the_new_request.save
      redirect_to("/follow_requests", { :notice => "Follow Request created successfully." })
    else
      redirect_to("/follow_requests", { :notice => "Follow Request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_followrequest = FollowRequest.where({ :id => the_id }).at(0)

    the_followrequest.recipient_id = params.fetch("query_recipient_id")
    the_followrequest.sender_id = params.fetch("query_sender_id")
    the_followrequest.status = params.fetch("query_status")

    if the_followrequest.valid?
      the_followrequest.save
      redirect_to("/follow_requests/#{the_followrequest.id}", { :notice => "FollowRequest updated successfully."} )
    else
      redirect_to("/follow_requests/#{the_followrequest.id}", { :alert => "FollowRequest failed to update successfully." })
    end
  end

  def destroy
    sender_id = params.fetch("sender_id")
    receiver_id = params.fetch("receiver_id")
    the_followrequest = FollowRequest.where({ :sender => sender_id, :recipient => receiver_id }).at(0)

    the_followrequest.destroy

    redirect_to("/follow_requests", { :notice => "Follow Request deleted successfully."} )
  end
end
