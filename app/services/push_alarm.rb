class PushAlarm
  SERVICE_URL = "https://bellbird.joinhandshake-internal.com/push".freeze

  def initialize(alarm_id)
    @alarm_id = alarm_id
  end

  def push
    uri = URI.parse(SERVICE_URL)
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = body
    
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    
    puts response.body
  end
  
  private
  def body
    { alarm_id: @alarm_id }.to_json
  end
end