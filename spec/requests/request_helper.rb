def set_email_params(address, email_type, event, timestamp)
  { 'email':
    {
      'address': address,
      'email_type': email_type,
      'event': event,
      'timestamp': timestamp
    }
  }.to_json
end
