json.array!(@paymonths) do |paymonth|
  json.extract! paymonth, :id, :month_year, :day_count, :month_name, :pay_month
  json.url paymonth_url(paymonth, format: :json)
end
