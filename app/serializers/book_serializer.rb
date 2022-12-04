class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :description, :price, :image
end
