class ControlledVocab < ActiveRecord::Base
  validates :field, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :field
end
