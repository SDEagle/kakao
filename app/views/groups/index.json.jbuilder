json.array!(@groups) do |group|
  json.extract! group, :name, :parent_group_id
  json.url group_url(group, format: :json)
end