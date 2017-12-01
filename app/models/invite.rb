class Invite < ApplicationRecord
  # Direct associations

  belongs_to :invitee,
             :class_name => "User"

  belongs_to :activity

  # Indirect associations

  # Validations

end
