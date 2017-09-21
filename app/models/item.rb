# Generated via
#  `rails generate hyrax:work Item`
class Item < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  # class setter  
  self.human_readable_type = 'Item'

  def self.to_csv
    attributes = %w{}
  end
end
