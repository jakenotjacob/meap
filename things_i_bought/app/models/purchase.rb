class Purchase < ActiveRecord::Base
  #Adding validation ( field presence, cost attribute [is a number, is greater than 0] )
  validates :name, presence: true
  validates :cost, numericality: { greater_than: 0 }
end
