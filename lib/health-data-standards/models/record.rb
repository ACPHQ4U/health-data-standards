class Record

  include Mongoid::Document
  
  field :first, type: String
  field :last, type: String
  field :gender, type: String
  field :birthdate, type: Integer
  field :effective_time, type: Integer
  field :race, type: Hash
  field :ethnicity, type: Hash
  field :languages, type: Array
  field :test_id, type: BSON::ObjectId
  field :medical_record_number, type: String

  embeds_many :allergies
  embeds_many :care_goals, class_name: "Entry"
  embeds_many :conditions, class_name: "Entry"
  embeds_many :encounters
  embeds_many :immunizations
  embeds_many :medical_equipment, class_name: "Entry"
  embeds_many :medications
  embeds_many :procedures
  embeds_many :results, class_name: "LabResult"
  embeds_many :social_history, class_name: "Entry"
  embeds_many :vital_signs, class_name: "Entry"

  Sections = [:allergies, :care_goals, :conditions, :encounters, :immunizations, :medical_equipment,
   :medications, :procedures, :results, :social_history, :vital_signs]
  
  def over_18?
    Time.at(birthdate) < Time.now.years_ago(18)
  end
end