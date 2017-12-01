class Activity < ApplicationRecord
  # Direct associations

  belongs_to :proposer,
             :class_name => "User"

  belongs_to :category

  has_many   :invites,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
