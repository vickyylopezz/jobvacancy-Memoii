require 'spec_helper'

describe JobOffer do
  describe 'valid?' do
    it 'should be invalid when title is blank' do
      check_validation(:title, "Title can't be blank") do
        described_class.new(location: 'a location')
      end
    end

    it 'should be invalid when experience is negative' do
      check_validation(:experience, 'Experience invalid experience') do
        described_class.new(title: 'a title', experience: -15)
      end
    end

    it 'should be invalid when experience is not a number' do
      check_validation(:experience, 'Experience invalid experience') do
        described_class.new(title: 'a title', experience: 'this is invalid')
      end
    end

    it 'should be valid when title is not blank' do
      job_offer = described_class.new(title: 'a title')
      expect(job_offer).to be_valid
    end

    it 'should be valid when title is not blank and experience is given' do
      job_offer = described_class.new(title: 'a title', experience: 5)
      expect(job_offer).to be_valid
    end
  end
end
