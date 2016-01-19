json.array!(@leave_employees) do |leave_employee|
  json.extract! leave_employee, :id, :leave_allot_id, :head_values
  json.url leave_employee_url(leave_employee, format: :json)
end
