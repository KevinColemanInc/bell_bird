module Alarms
  class Create
    attr_accessor :alarm_params
    def initialize(alarm_params)
      @alarm_params = alarm_params
    end

    def perform
      @alarm = Alarm.new(alarm_params)
      AlertPushJobJob.perform_later(@alarm.id) if @alarm.save
      @alarm
    end
  end
end