class Calendar
  attr_reader :date
  include Enumerable

  def initialize( attrs = {} )
    @clock  = attrs.fetch(:clock)  { Date.today }
    @events = attrs.fetch(:events) { [] }
    @week_starts_on = attrs.fetch(:week_starts_on) { :sunday }
    @date = attrs[:date] || DateTime.now.beginning_of_day
  end

  # TODO: hacer que devuelva los eventos futuros
  def events
    Event.where("date >= ?", [DateTime.now.beginning_of_day])
  end

  def all_events
    Event.all
  end

  def events_for(date)
    Event.where(date: date)
  end

  def new_event(*args)
    Event.new(*args)
  end

  def add_event(event)
    event.publish
  end

  def each
    Event.all.each { |event| yield event }
  end

  def find_event(event_id)
    Event.find(event_id)
  end

end
