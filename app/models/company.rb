class Company < ApplicationRecord
  has_one_attached :company_logo

  has_many :filmcompanies
  has_many :films, through: :filmcompanies
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
end