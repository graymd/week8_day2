require 'rails_helper'

RSpec.describe Doctor, type: :model do 
  subject do
    Doctor.new({
      doctor_name: "Kitter",
      doctorable_id: "",
      doctorable_type: ""
    })
  end

#Need to validate model

end