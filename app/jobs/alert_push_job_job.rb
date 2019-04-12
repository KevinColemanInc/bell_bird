class AlertPushJobJob < ApplicationJob
  queue_as :default

  def perform(id)
    alarm = Alarm.find(id)
    PushAlarm.new(alarm.id).push
  end
end
