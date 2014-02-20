class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  # GET /events
  def index
    locals = {}
    date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    calendar = Calendar.new(date: date)
    locals[:calendar]  = calendar
    locals[:new_event] = calendar.new_event
    locals[:date]      = date
    render "index", locals: locals
  end

  # GET /events/1
  def show
    render "show", locals: { event: @event }
  end

  # GET /events/new
  def new
    @event = Event.new(announcement: params[:announcement].present?,
                       front_page: params[:front_page].present?)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Se ha creado el evento' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      @event.destroy_poster_file if @event.poster_file
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'El evento fue actualizado.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end

  def poster
    event = Event.find(params[:event_id])
    respond_to do |format|
      format.jpg do
        if event.poster_file
          jpg = event.poster_file
          send_data( jpg,
                     filename: "#{event.id}.jpg",
                     type:     "image/jpg")
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :date, :content, :poster, :announcement, :front_page)
    end
end
