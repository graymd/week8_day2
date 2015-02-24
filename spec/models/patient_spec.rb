require 'rails_helper'

RSpec.describe Patient, type: :model  do
  subject do
    Patient.new({
      first_name: "Kitter",
      last_name: "Cat",
      description: "sick",
      gender: "male",
      blood_type: "O-",
      date_of_birth: 10/14/2001
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
    expect(subject.date_of_birth).to eq(10/14/2001)
  end

  it "should NOT have a date_of_birth" do
    expect(subject.date_of_birth).not_to eq(nil)
  end


  
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