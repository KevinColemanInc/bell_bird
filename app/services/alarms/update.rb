module Alarms
  class Update
    attr_accessor :alarm_params, :alarm
    def initialize(alarm, alarm_params)
      @alarm = alarm
      @alarm_params = alarm_params
    end

    def perform
      alarm.increment!(:vote_counter) if alarm_params[:up]
      alarm
    end
  end
end