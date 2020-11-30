class Comment < ApplicationRecord
  belongs_to :search, optional: true
end
