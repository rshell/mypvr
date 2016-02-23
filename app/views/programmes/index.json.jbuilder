json.array!(@programmes) do |programme|
  json.extract! programme, :id
  json.url programme_url(programme, format: :json)
end
