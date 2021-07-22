json.extract! employee, :id, :name, :last_name, :rfc, :job_title, :office_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
