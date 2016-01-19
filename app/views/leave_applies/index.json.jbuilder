json.array!(@leave_applies) do |leave_apply|
  json.extract! leave_apply, :id, :from_date, :to_date, :leave_structure_id, :employee_id
  json.url leave_apply_url(leave_apply, format: :json)
end
