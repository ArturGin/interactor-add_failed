# frozen_string_literal: true

RSpec.describe Interactor::AddFailed do
  let!(:interactor_success) {
    class ActorSuccess
      include Interactor
      def call; end
    end
  }

  let!(:interactor_failure) {
    class ActorFail
      include Interactor
      def call; context.fail! end
    end
  }

  let(:organizer) {
    them = interactors
    Class.new do
      include Interactor::Organizer
      include Interactor::AddFailed

      organize them
    end.call
  }

  it "has a version number" do
    expect(Interactor::AddFailed::VERSION).not_to be nil
  end

  it 'raises a NotAnInteractor exception when included in a non-Interactor::Organizer' do
    expect do
      Class.new do
        include Interactor::AddFailed
      end
    end.to raise_error(
      Interactor::AddFailed::NotAnInteractor,
      /.*Class.*does not include `Interactor::Organizer'$/
    )
  end


  context 'when the organizer fails' do
    let(:interactors) { [ActorSuccess, ActorFail]  }
    it 'has successfull_interactors if any passed' do
      expect(organizer.successfull_interactors).to include(ActorSuccess)
      expect(organizer.failed_interactor).to eq(ActorFail)
    end
  end
  
  context 'when organizer is successful' do
    let(:interactors) { [ActorSuccess] }
    it 'has organized interactors as successful interactors' do
      expect(organizer.successfull_interactors).to eq(interactors)
    end
  end
end
