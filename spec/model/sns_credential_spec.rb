require 'rails_helper'

describe User do
  describe '#self.find_oauth' do
    it "is invalid without an uid" do
      sns_credential = build(:sns_credential, uid: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include("can't be blank")
    end

    it "is invalid without a provider" do
      sns_credential = build(:sns_credential, provider: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include("can't be blank")
    end
  end
end