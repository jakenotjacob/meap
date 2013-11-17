class Project < ActiveRecord::Base
  validates :name, presence: true
  #Links projects to 'thing' association on Permission objects
  #used in scope 'viewable_by' below
  has_many :permissions, as: :thing

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view", user_id: user.id })
  end
  has_many :tickets, dependent: :delete_all
end
