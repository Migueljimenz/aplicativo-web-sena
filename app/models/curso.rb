class Curso < ApplicationRecord
  validates :ficha, uniqueness: true
  belongs_to :programa
end
