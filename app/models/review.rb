class Review < ApplicationRecord
   belongs_to :gear through, :booking
end
