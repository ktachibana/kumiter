class MembersController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @member = Member.new(member_params.merge(event: @event))

    if @member.save
      redirect_to @event, notice: 'Member was successfully created.'
    else
      render 'events/show'
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :event_id)
  end
end
