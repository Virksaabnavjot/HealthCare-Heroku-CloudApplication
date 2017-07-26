json.extract! tran, :id, :firstname, :lastname, :firm, :cost, :description, :age, :created_at, :updated_at
json.url tran_url(tran, format: :json)
