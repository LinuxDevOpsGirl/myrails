class Company < ApplicationRecord
  has_many :filmcompanies
  has_many :films, through: :filmcompanies
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
end