client = Drip::Client.new do |c|
  c.api_key = ENV["DRIP_CLIENT_API_TOKEN"]
  c.account_id = ENV["DRIP_ACCOUNT_ID"]
end