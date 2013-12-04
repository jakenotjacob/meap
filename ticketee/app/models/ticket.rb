class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  #Defines setter for file uploading
  has_many :assets
  #=>Applies to Ticket's new/build/update-methods
  accepts_nested_attributes_for :assets
end
