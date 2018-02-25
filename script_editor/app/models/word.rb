class Word < ApplicationRecord
  belongs_to :line
  has_many :edits, through: :cuts
  has_many :cuts
end
