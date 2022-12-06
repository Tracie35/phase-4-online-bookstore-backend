class ReviewSerializer < ActiveModel::Serializer
  attributes :comment
  belongs_to :book
end
