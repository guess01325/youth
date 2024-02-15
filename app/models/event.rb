class Event < ApplicationRecord
    belongs_to :user
    has_many :volunteers 
    # ,dependent: :destroy
    has_many :students
    # , dependent: :destroy 
end
