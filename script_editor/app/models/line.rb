class Line < ApplicationRecord
  belongs_to :scene
  has_many :words
end
