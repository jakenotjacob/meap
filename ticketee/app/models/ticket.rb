class Ticket < ActiveRecord::Base
  searcher do
    label :tag, from: :tags, field: :name
  end
  belongs_to :project
  belongs_to :state
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  #Defines setter for file uploading
  has_many :assets
  #=>Applies to Ticket's new/build/update-methods
  accepts_nested_attributes_for :assets
  has_many :comments

  has_and_belongs_to_many :tags

  def tag_names
    @tag_names
  end

  def tag_names=(names)
    @tag_names = names
  end

  before_create :associate_tags

  private
    def associate_tags
      if tag_names
        tag_names.split(" ").each do |name|
          self.tags << Tag.find_or_create_by(name: name)
        end
      end
    end

end

