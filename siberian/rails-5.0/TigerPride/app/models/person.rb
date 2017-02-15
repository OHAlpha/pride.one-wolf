class Person < ApplicationRecord
  belongs_to :added_by, class_name: 'Account', optional: true
  has_many :monickers
  has_many :emails
  has_many :residences
  has_many :phones
  has_many :languages
  
  has_many :relations_to, class_name: 'Relationship', foreign_key: 'person_a_id'
  has_many :relations_from, class_name: 'Relationship', foreign_key: 'person_b_id'
  has_many :related_to, class_name: 'Person', through: :relations_to, source: :person_b
  has_many :related_from, class_name: 'Person', through: :relations_from, source: :person_a
  
  has_one :user
  
  before_create PersonUniqueId.new
  
  def primary_monicker
      monickers.where(primary: true).first
  end
  
  def primary_email
      emails.where(primary: true).first
  end
  
  def primary_residence
      residences.where(primary: true).first
  end
  
  def primary_phone
      phones.where(primary: true).first
  end
  
  def primary_language
      languages.where(primary: true).first
  end
  
  def relations
      relations_to.or relations_from
  end
  
  def related
      related_to + related_from
  end
end
