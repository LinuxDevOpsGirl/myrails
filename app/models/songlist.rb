class Songlist < ApplicationRecord
  has_many :songs
  has_many :songlists, through: :songs
  
end