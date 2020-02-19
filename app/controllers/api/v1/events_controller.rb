class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(Event.all)
  end

  def create
    prms = event_params
    @event = Event.new(event_params)
    if @event.save
        render json: EventSerializer.new(@event)
    else
      render json: { errors: "missing field"}, status: 401
    end
    # binding.pry
    # event_params = json_parse(request)
  end

private

  def event_params
    # binding.pry
    params.require(:event).permit(:name, :details)
  end
end
