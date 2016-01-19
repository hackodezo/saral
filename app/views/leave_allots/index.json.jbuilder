json.array!(@leave_allots) do |leave_allot|
  json.extract! leave_allot, :id, :leave_structure_id, :employee_id
  json.url leave_allot_url(leave_allot, format: :json)
end
