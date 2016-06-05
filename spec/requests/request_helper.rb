def set_email_params(address, type, event, timestamp)
  { 'email':
    {
      'address': address,
      'type': type,
      'event': event,
      'timestamp': timestamp
    }
  }.to_json
end
