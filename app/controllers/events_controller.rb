class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @future_events = @events.upcoming_events
    @past_events = @events.past_events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @event_attendees = @event.attendees
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events
  # POST /events.json
  def create
    respond_to do |format|
      if current_user
        @event = current_user.events.build(event_params)
        @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, alert: 'Please Sign In.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Your event was updated'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end

  def require_same_user
    return unless current_user != @event.creator

    flash[:alert] = 'You can only edit or delete your own event.'
    redirect_to @event
  end
end
