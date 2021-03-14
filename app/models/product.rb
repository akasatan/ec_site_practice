class Product < ApplicationRecord
  belongs_to :genre
  attachment :product_image
  enum is_valid: {販売中: true ,販売中止: false}
end
