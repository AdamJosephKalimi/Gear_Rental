class Review < ApplicationRecord
   belongs_to :gear through, :booking
   belongs_to :user through, :booking
end
