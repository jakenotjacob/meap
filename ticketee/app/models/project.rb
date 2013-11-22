class Project < ActiveRecord::Base
  validates :name, presence: true
  #Links projects to 'thing' association on Permission objects
  #used in scope 'viewable_by' below
  has_many :permissions, as: :thing
  has_many :tickets, dependent: :delete_all

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view", user_id: user.id })
  end

  scope :for, ->(user) do
    user.admin? ? Project.all : Project.viewable_by(user)
  end

end

