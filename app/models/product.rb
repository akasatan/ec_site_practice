class Product < ApplicationRecord
  belongs_to :genre_id
  attachment :product_image
  enum is_vaild: { "販売中": true, "販売中止": false }
end
