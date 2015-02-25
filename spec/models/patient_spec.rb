require 'rails_helper'
require 'date'

@date = Date.new(2001,2,3)
@date.strftime('%Y%m%d')

RSpec.describe Patient, type: :model  do
  subject do
    Patient.new({
      first_name: "Kitter",
      last_name: "Cat",
      description: "sick",
      gender: "male",
      blood_type: "O-",
      date_of_birth: 2001-07-07
    })
  end

  let(:doctor) do
    Doctor.new({
      doctor_name: "Maddie"
      })
  end

  let(:medication) do
    Medication.new({
      name: "pill",
      company: "the pill co",
      adverse_reactions: "abdominal pain",
      generic_option: true
    })
  end

  it "should have a first_name" do
  expect(subject.first_name).to eq('Kitter')

  end

  it "should NOT have a first_name" do
    expect(subject.first_name).not_to eq(nil)
  end

  it "should have a last_name" do
    expect(subject.last_name).to eq('Cat')
  end

  it "should NOT have a last_name" do
    expect(subject.last_name).not_to eq(nil)
  end

  it "should have a description" do
    expect(subject.description).to eq('sick')
  end

  it "should NOT have a description" do
    expect(subject.description).not_to eq(nil)
  end

  it "should have a gender" do
    expect(subject.gender).to eq('male')
  end

  it "should NOT have a gender" do
    expect(subject.gender).not_to  eq(nil)
  end


  it "should have a blood type" do
    expect(subject.blood_type).to eq('O-')
  end

  it "should NOT have a blood type" do
    expect(subject.blood_type).not_to eq(nil)
  end

  it "should have a date_of_birth" do
    expect(subject.date_of_birth).to eq(2001-07-07)
  end

  it "should NOT have a date_of_birth" do
    expect(subject.date_of_birth).not_to eq(nil)
  end

  it "should validate when we have a first name" do
    expect(subject.errors).not_to include(:first_name)
  end

  it "should validate when we do NOT have a first name" do
    patient1 = Patient.new
    patient1.save
    expect(patient1.errors).to include(:first_name)
  end

  it "should validate when we have a last_name" do
    expect(subject.errors).not_to include(:last_name)
  end

  it "should validate when we do NOT have a last_name" do
    patient1 = Patient.new
    patient1.save
    expect(patient1.errors).to include(:last_name)
  end

  # it "should validate when we have a date_of_birth of at least 10 years old" do
  #   expect(subject.at_least_10).not_to eq()
  # end

  # it "should validate when we do NOT have a date_of_birth of at least 10 years old" do
  #   patient1 = Patient.new
  #   patient1.save
  #   expect(patient1.errors).to include(:date_of_birth)
  # end

  it "should validate when we have a description" do
    expect(subject.errors).not_to include(:description)
  end

  it "should validate when we do NOT have a description" do
    patient1 = Patient.new
    patient1.save
    expect(patient1.errors).to include(:description)
  end

  it "should validate when we have a gender" do
    expect(subject.errors).not_to include(:gender)
  end

  it "should validate when we do NOT have a gender" do
    patient1 = Patient.new
    patient1.save
    expect(patient1.errors).to include(:gender)
  end

  it "should validate when we have a blood_type" do
    expect(subject.errors).not_to include(:blood_type)
  end

  it "should validate when we do NOT have a blood_type" do
    patient1 = Patient.new
    patient1.save
    expect(patient1.errors).to include(:blood_type)
  end

  it "should start in the state of waiting_room" do
    expect(subject.current_state.events.keys).to eq([
      :to_doctor,
      :to_xray,
      :to_surgery,
      :leave
    ])
  end

  # it "should be able to transfer to 3 states from doctor_checkup" do
  #   subject.save
  #   subject.to_doctor!
  #   expect(subject.current_state.events.keys).to eq([
  #     :to_xray,
  #     :to_surgery,
  #     :to_pay_bill
  #   ])
  # end

  # it "should be able to transfer to 3 states from xray" do
  #   subject.save
  #   subject.to_doctor!
  #   subject.to_xray!
  #   expect(subject.current_state.events.keys).to eq([
  #     :to_doctor,
  #     :to_surgery,
  #     :to_pay_bill
  #    ])
  # end

  # it "should be able to transfer to 3 states from surgery" do
  #   subject.save
  #   subject.to_doctor!
  #   subject.to_xray!
  #   subject.to_surgery!
  #   expect(subject.current_state.events.keys).to eq([
  #     :to_doctor,
  #     :to_xray,
  #     :to_pay_bill
  #    ])
  # end

    # it "should be able to transfer to 1 state from pay_bill" do
    #   subject.save
    #   subject.to_doctor!
    #   subject.to_pay_bill!
    #   expect(subject.current_state.events.keys).to eq([
    #     :leave
    #   ])
    # end

    # it "should be able to transfer to 1 state from left" do
    #   subject.save
    #   subject.to_doctor!
    #   subject.to_pay_bill!
    #   subject.leave!
    #   expect(subject.current_state.events.keys).to eq([
    #     :wait
    #   ])
    # end

    it "should have ability to add doctors" do
      subject.doctors << doctor
      expect(subject.doctors.length).to eq(1)
    end

    it "should have ability to add medications" do
      subject.medications << medication
      expect(subject.medications.length).to eq(1)
    end

    #Need to check that belongs to is valid











  
end

  # t.string   "first_name",     limit: 255
  #   t.string   "last_name",      limit: 255
  #   t.date     "date_of_birth"
  #   t.text     "description",    limit: 65535
  #   t.string   "gender",         limit: 255
  #   t.string   "blood_type",     limit: 255
  #   t.datetime "created_at",                   null: false
  #   t.datetime "updated_at",                   null: false
  #   t.integer  "clinic_id",      limit: 4
  #   t.string   "workflow_state", limit: 255