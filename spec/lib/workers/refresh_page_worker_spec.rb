require File.expand_path '../../../spec_helper.rb', __FILE__

describe RefreshPackageWorker do
  describe 'scheduling' do
    it 'will be scheduled daily' do
      valid, invalid = times

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)

      Timecop.freeze(Time.now.beginning_of_day + 1.day + 13.hours)

      # Testing the past time is no longer valid
      expect(next_occurrence).not_to eq(valid)

      valid, invalid = times(1.day)

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)
    end
  end

  def next_occurrence
    RefreshPackageWorker.schedule.next_occurrence
  end

  def times(offset = 1.day)
    valid = Time.now.beginning_of_day + 12.hours + offset
    invalid = valid + 1.minute

    [valid, invalid]
  end
end
