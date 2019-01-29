class Person < ApplicationRecord
  has_many :filmers
  has_many :film_filmers, through: :filmers, source: :film
  
  has_many :editors
  has_many :film_editors, through: :editors, source: :film

  has_many :riders
  has_many :sections, through: :riders
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
end