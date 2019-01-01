class Company < ApplicationRecord
  has_many :filmcompanies
  has_many :films, through: :filmcompanies
  
end