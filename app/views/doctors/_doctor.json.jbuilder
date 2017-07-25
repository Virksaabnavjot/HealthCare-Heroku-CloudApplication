json.extract! doctor, :id, :firstname, :lastname, :address, :user_id, :phone, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
