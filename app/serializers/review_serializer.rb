class ReviewSerializer < ActiveModel::Serializer
  attributes :comment
  belongs_to :book
  belongs_to :user
end
