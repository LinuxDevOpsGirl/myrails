class Film < ApplicationRecord
  
  has_many :sections
  has_many :filmers
  has_many :people_filmers, through: :filmers, source: :person
  
  has_many :editors
  has_many :people_editors, through: :editors, source: :person
  
  has_many :filmcompanies
  has_many :film_companies, through: :filmcompanies, source: :company
  
end