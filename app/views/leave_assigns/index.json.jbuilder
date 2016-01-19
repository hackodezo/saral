json.array!(@leave_assigns) do |leave_assign|
  json.extract! leave_assign, :id, :leave_head_id, :leave_structure_id
  json.url leave_assign_url(leave_assign, format: :json)
end
