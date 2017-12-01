class Group < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "creator_id"

  # Indirect associations

  # Validations

end
