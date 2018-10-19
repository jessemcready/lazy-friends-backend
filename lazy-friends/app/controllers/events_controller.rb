class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    render json: @event, status: :ok
  end

  def create
    @event = Event.find_or_create_by(event_params)
    render json: @event, status: :created
  end


  private
  def event_params
    params.require(:event).permit(:group_id, :date, :name)
  end

end
