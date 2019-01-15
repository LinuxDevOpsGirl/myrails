class Person < ApplicationRecord
  has_many :filmers
  has_many :films, through: :filmers
  
  has_many :editors
  has_many :films, through: :editors

  has_many :riders
  has_many :sections, through: :riders
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
end