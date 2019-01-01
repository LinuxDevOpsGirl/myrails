class Song < ApplicationRecord
  belongs_to :section
  belongs_to :songlist
end