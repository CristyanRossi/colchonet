class Room < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	belongs_to :user
	validates_presence_of :title, :location, :description

	def complete_name
		"#{title}, #{location}"
	end

	def  self.most_recent
		order(created_at: :desc)
	end
end
