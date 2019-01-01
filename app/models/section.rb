class Section < ApplicationRecord
  belongs_to :film
  
  has_many :riders
  has_many :people_riders, through: :riders, source: :person
  
  has_many :songs
  has_many :section_songs, through: :songs, source: :songlist
  
end