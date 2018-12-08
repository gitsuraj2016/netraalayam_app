json.extract! employee, :id, :emp_id, :name, :mobile, :email, :optometrist, :hto, :manager, :active, :created_at, :updated_at
json.url employee_url(employee, format: :json)
