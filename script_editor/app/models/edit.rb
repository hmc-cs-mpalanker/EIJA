class Edit < ApplicationRecord
  has_many :words, through: :cuts
  has_many :words, through: :line_cuts
  belongs_to :play
end
