class Edit < ApplicationRecord
  has_many :words, through: :cuts
  belongs_to :play
end
