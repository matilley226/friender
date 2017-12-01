class Group < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "creator_id"

  # Indirect associations

  # Validations

end
