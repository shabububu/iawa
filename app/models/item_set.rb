# Generated via
#  `rails generate hyrax:work ItemSet`
class ItemSet < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }
 
  has_many :items 
  self.human_readable_type = 'Item Set'
end
