require 'flote/capture_single_run_command'

describe CaptureSingleRunCommand do

	before (:each) do
		@shell_mock = mock
		@view_mock = mock
		@runner_mock = mock
		@runner_mock.should_receive(:run_command=).any_number_of_times
		@command = CaptureSingleRunCommand.new @shell_mock, @view_mock, @runner_mock
  end

	it "should enforce the shell_command parameter" do
		@view_mock.should_receive(:show_missing_command_argument_error).with('capture-single-run', 'shell_command')
		@command.execute_from_shell ['capture-single-run']
	end

end
