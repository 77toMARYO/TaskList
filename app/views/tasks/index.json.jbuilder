json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :start, :finish, :detail, :done
  json.url task_url(task, format: :json)
end
