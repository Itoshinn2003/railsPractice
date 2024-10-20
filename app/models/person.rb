class Person < ApplicationRecord
    validates :name, presence: true, length: { maximum: 20}
    validates :age, numericality: true
end
