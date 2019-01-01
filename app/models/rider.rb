class Rider < ApplicationRecord
  belongs_to :section
  belongs_to :person
end