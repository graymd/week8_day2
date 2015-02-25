require 'rails_helper'

RSpec.describe PatientsHelper, type: :helper do 

  subject do
    Patient.new({
      first_name: "Kitter",
      last_name: "Cat",
      description: "sick",
      gender: "male",
      blood_type: "O-",
      date_of_birth: 10.years.ago
    })
  end

  it "should display Patient is In Waiting Room if patient.workflow_state == waiting_room" do
    expect(subject.workflow_state).to eq('waiting_room')
  end
  
end