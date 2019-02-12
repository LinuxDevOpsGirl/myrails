class Songlist < ApplicationRecord
  has_many :songs
  has_many :sections, through: :songs
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}-#{artist.gsub(/[^a-z0-9]+/i, '-')}"
  end

end