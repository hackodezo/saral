json.array!(@leave_structures) do |leave_structure|
  json.extract! leave_structure, :id, :name
  json.url leave_structure_url(leave_structure, format: :json)
end
