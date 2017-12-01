class Activity < ApplicationRecord
  # Direct associations

  has_many   :invites,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
