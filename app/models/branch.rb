class Branch < ActiveRecord::Base
 
  acts_as_gmappable
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :city
  belongs_to :state
  belongs_to :country

  belongs_to :patron
  has_many :users
  has_many :positions
  has_many :loadings
  has_many :journals, as: :journaled, dependent: :destroy

  attr_accessible :name, :tel, :fax, :postcode, :district, :address, :city_id, :country_id, :status, :patron_id

  validates_presence_of :name#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_length_of   :name, :maximum => 100#, :message => I18n.t('tasks.errors.name.too_long')

  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end
  
  def prevent_geocoding
    self.address.blank? #|| (!self.location.blank?)
  end
  
end
