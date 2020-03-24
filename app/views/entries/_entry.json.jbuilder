json.extract! entry, :id, :user_id, :reason_id, :timespent, :recording, :notes, :created_at, :updated_at
json.url entry_url(entry, format: :json)
