def email_to_json(address, email_type, event, timestamp)
  {
    'Address': address,
    'EmailType': email_type,
    'Event': event,
    'Timestamp': timestamp
  }.to_json
end
