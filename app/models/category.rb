class Category < ApplicationRecord
  mount_uploader :icon, IconUploader

  # Direct associations

  has_many   :activities

  # Indirect associations

  # Validations

end
