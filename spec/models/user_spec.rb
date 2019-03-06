require 'rails_helper'

RSpec.describe User, type: :model do
  context "User" do
    before :each do
     @doctor = build(:doctor)
     @user = build(:user, resource: @doctor)
    end
    it "Valid user" do
      expect(@user.save).to eq(true)
    end

    it "Invalid user" do
      @user.username = ''
      expect(@user.save).to eq(false)
    end

    it "should be doctor" do
      expect(@user.save).to eq(true)
      expect(@user.resource_type).to eq('Doctor')
    end

    it "should be patient" do
      patient = build(:patient)
      @user.resource = patient
      expect(@user.save).to eq(true)
      expect(@user.resource_type).to eq('Patient')
    end
  end
end
