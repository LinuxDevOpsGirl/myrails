class Filmcompany < ApplicationRecord
  belongs_to :film
  belongs_to :company
  
end