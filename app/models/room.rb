class Room < ActiveRecord::Base
	has_may :reviews
	has_many :reviewed_rooms, through: :reviews, source: :room
	belongs_to :user
	validates_presence_of :title, :location, :description
	scope :most_recent, -> { order('created_at DESC') }
	def complete_name
		"#{title}, #{location}"
	end
end
