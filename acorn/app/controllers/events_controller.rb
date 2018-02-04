class EventsController < ApplicationController
  # load_and_authorize_resource
  respond_to :html

  def index
    @metadata = Event.ransack(params[:q])
    @metadata.sorts = ['updated_at desc', 'created_at desc'] if @metadata.sorts.empty?
    @events = @metadata.result.page(params[:page]).per(params[:per_page])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to event_path(@event)
  end

  def update
    @event.update(event_params)
    redirect_back(fallback_location: event_path)
  end

  def destroy
    @event.destroy
    flash[:info] = "#{@event.title} has been deleted"
    redirect_to '/members/profile'
  end

  private

  def event_params
    params[:event].permit(*Event.attribute_names)
  end
end
