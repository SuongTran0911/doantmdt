json.extract! category, :id, :nameCategory, :parent_id, :sort_order, :created_at, :updated_at
json.url category_url(category, format: :json)