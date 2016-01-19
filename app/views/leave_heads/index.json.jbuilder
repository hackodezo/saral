json.array!(@leave_heads) do |leave_head|
  json.extract! leave_head, :id, :name
  json.url leave_head_url(leave_head, format: :json)
end
