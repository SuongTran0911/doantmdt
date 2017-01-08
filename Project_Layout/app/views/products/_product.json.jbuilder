json.extract! product, :id, :nameProduct, :price, :content, :discount, :image_link, :image_list, :view, :user_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)