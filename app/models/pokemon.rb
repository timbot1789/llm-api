class Pokemon < ApplicationRecord
  has_and_belongs_to_many :visitors
end
