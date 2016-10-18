class Track < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]
end
