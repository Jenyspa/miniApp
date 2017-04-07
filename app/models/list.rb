class List < ApplicationRecord
  has_many :tasks, inverse_of: :list
  accepts_nested_attributes_for :tasks
end
