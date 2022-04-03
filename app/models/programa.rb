class Programa < ApplicationRecord
  validates :nombre, uniqueness: true
  belongs_to :area
  has_many :curso, dependent: :destroy
end
