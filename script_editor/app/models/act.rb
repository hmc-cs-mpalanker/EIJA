class Act < ApplicationRecord
  belongs_to :play
  has_many :scenes
end
