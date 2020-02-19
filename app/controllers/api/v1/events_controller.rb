class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(Event.all)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
        render json: EventSerializer.new(@event)
    else
      render json: { errors: "missing name"}, status: 401
    end
  end

private

  def event_params
    params.permit(:name, :details)
  end
end
