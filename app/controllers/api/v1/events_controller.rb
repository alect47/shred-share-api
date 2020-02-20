class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(Event.all)
  end

  def show
    id = event_params[:id]
    if Event.exists?(id)
      event = Event.find(id)
      render json: EventSerializer.new(event)
    else
      render json: { errors: "invalid id"}, status: 404
    end
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
    params.permit(:name, :details, :id)
  end
end
