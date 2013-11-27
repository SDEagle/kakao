json.array!(@results) do |json, result|
  json.name result.name
  json.id result.id
  json.type result.class.to_s
end