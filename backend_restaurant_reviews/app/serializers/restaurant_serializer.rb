class RestaurantSerializer # this was created with the help of fast json_api
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :slug

  has_many: reviews
end
