require 'flote/start_command'

describe StartCommand do

	before (:each) do
		@view_mock = mock.as_null_object
		@upload_command_mock = mock
		@runner_mock = mock
		@command = StartCommand.new @runner_mock, @view_mock
  end

	it "should start scheduler" do
		@runner_mock.should_receive(:run_command=).with 'aCommand.sh'
		scheduler_mock = mock
		Scheduler.should_receive(:new).and_return scheduler_mock
		scheduler_mock.should_receive(:start)
		@command.start 'aCommand.sh'
	end
	
end
