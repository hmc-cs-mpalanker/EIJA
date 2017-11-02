class Scene < ApplicationRecord
  belongs_to :act
  has_many :lines
end
