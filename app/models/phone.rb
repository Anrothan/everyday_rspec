class Phone < ActiveRecord::Base
	belongs_to :contact

	validates :phone_type, presence: true
validates :phone, uniqueness: { scope: :contact_id }, presence: true
end
