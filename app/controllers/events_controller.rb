class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :shuffle, :update, :destroy]

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render 'home/index'
    end
  end

  def shuffle
    @pairs = @event.members.to_a.shuffle.in_groups_of(2, false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name)
    end
end
