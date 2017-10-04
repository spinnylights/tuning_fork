json.extract! task, :id, :name, :status, :task_group_id, :created_at, :updated_at
json.url task_url(task, format: :json)
