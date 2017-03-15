class Person < ApplicationRecord
  belongs_to :added_by, class_name: 'Account'
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
      monickers.find_by primary: true
  end
  
  def primary_name
    primary_monicker.name.name
  end
  
  def primary_email
      emails.find_by primary: true
  end
  
  def onewolf_email
      emails.find_by kind: 'onewolf'
  end
  
  def primary_residence
      residences.find_by primary: true
  end
  
  def primary_address
    primary_residence.address.address
  end
  
  def primary_phone
      phones.find_by primary: true
  end
  
  def primary_language
      languages.find_by primary: true
  end
  
  def relations
      relations_to.or relations_from
  end
  
  def related
      related_to + related_from
  end
end
