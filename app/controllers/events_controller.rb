class EventsController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def new
    @event = current_user.events.build
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      flash.now[:danger] = "Please recheck your input"
      render 'new'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title,:location,:date)
    end

    def logged_in
      redirect_to login_path unless logged_in?
    end
end
