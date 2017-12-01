class Membership < ApplicationRecord
  # Direct associations

  belongs_to :group

  belongs_to :member,
             :class_name => "User"

  # Indirect associations

  # Validations

end
