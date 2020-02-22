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

  def update
    id = event_params[:id]
    if Event.exists?(id)
      event = Event.find(id)
      if event.update(event_params)
        render json: EventSerializer.new(event)
      end
    else
      render json: { errors: "invalid id or poorly formatted request"}, status: 404
    end
  end

private

  def event_params
    params.permit(:name, :details, :id)
  end
end
