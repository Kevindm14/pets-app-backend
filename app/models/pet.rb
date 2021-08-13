class Pet < ApplicationRecord
  belongs_to :user

  message = 'No puede estar en blanco'

  validates_presence_of :name, message: message
  validates_presence_of :species, message: message
  validates_presence_of :gender, message: message
  validates_presence_of :status, message: message
  validates_presence_of :day_of_birth, message: message
  validates_presence_of :age, message: message
  validates_presence_of :weigth, message: message
  validates_presence_of :description, message: message
  validates_presence_of :reason, message: message
  validates_presence_of :country, message: message
  validates_presence_of :province, message: message
  validates_presence_of :contact_phone, message: message
end
