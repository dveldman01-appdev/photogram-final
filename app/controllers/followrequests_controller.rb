class FollowrequestsController < ApplicationController
  def index
    matching_followrequests = Followrequest.all

    @list_of_followrequests = matching_followrequests.order({ :created_at => :desc })

    render({ :template => "followrequests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_followrequests = Followrequest.where({ :id => the_id })

    @the_followrequest = matching_followrequests.at(0)

    render({ :template => "followrequests/show.html.erb" })
  end

  def create
    the_request_recipient_id = params.fetch("query_recipient_id")
    the_recipient = User.where({ :id => the_request_recipient_id }).at(0)
        
    the_followrequest = Followrequest.new
    the_followrequest.recipient_id = the_request_recipient_id
    the_followrequest.sender_id = session.fetch(:user_id)

    # When a FollowRequest is created you need to check if the recipient of the request is a private User. If they are private, the status column of the FollowRequest should be set to "pending". If they are not private the status should be set to "accepted".
    if the_recipient.private == TRUE
      the_followrequest.status = "pending"
    else
      the_followrequest.status = "accepted"
    end
    
    if the_followrequest.valid?
      the_followrequest.save
      redirect_to("/followrequests", { :notice => "Followrequest created successfully." })
    else
      redirect_to("/followrequests", { :notice => "Followrequest failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_followrequest = Followrequest.where({ :id => the_id }).at(0)

    the_followrequest.recipient_id = params.fetch("query_recipient_id")
    the_followrequest.sender_id = params.fetch("query_sender_id")
    the_followrequest.status = params.fetch("query_status")

    if the_followrequest.valid?
      the_followrequest.save
      redirect_to("/followrequests/#{the_followrequest.id}", { :notice => "Followrequest updated successfully."} )
    else
      redirect_to("/followrequests/#{the_followrequest.id}", { :alert => "Followrequest failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_followrequest = Followrequest.where({ :id => the_id }).at(0)

    the_followrequest.destroy

    redirect_to("/followrequests", { :notice => "Followrequest deleted successfully."} )
  end
end
