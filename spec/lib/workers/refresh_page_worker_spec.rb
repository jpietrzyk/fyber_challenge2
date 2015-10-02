require File.expand_path '../../../spec_helper.rb', __FILE__

describe RefreshPackageWorker do
  describe 'scheduling' do
    it 'will be scheduled daily' do
      Timecop.freeze(Time.now.beginning_of_day)
      valid, invalid = times

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)

      Timecop.freeze(Time.now.beginning_of_day + 13.hours)
      valid, invalid = times(1.day)

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)
    end
  end

  def next_occurrence
    RefreshPackageWorker.schedule.next_occurrence
  end

  def times(offset = 0.day)
    valid = Time.now.beginning_of_day + 12.hours + offset
    invalid = valid + 1.minute

    [valid, invalid]
  end
end
