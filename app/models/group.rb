class Group < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "creator_id"

  # Indirect associations

  has_many   :members,
             :through => :memberships,
             :source => :member

  # Validations

end
