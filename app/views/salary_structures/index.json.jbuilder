json.array!(@salary_structures) do |salary_structure|
  json.extract! salary_structure, :id, :basic, :da, :hra, :pf, :others, :pt, :emp_pf, :gratuity, :conveyance, :special_allowance, :gross, :monthly_ctc, :name
  json.url salary_structure_url(salary_structure, format: :json)
end
