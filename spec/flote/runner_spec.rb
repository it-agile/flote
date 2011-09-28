require 'shellutils/shell_process'
require 'flote/runner'

describe Runner, "in run mode" do

  before (:each) do
    @shell_mock = mock.as_null_object
		@shell_mock.should_receive(:expand_run_command).with('run-once.sh').and_return 'bash run_once.sh'
		@view_mock = mock.as_null_object
    @runner = Runner.new @shell_mock, @view_mock
    @runner.run_command = "run-once.sh"
  end

  it "should run ruby command" do
		process_mock = mock
    @shell_mock.should_receive(:execute).and_return process_mock
    @runner.start
  end

  it "should not run if the source files weren't modified" do
    a_time = Time.new
	  @shell_mock.should_receive(:files_in_dir_tree).twice.and_return ['my_file.rb']
	  @shell_mock.should_receive(:newest_dir_entry).twice.and_return 'my_file.rb'
    @shell_mock.should_receive(:modification_time).with("my_file.rb").and_return a_time
    @runner.start
    @shell_mock.should_receive(:modification_time).with("my_file.rb").and_return a_time
    @runner.execute
  end

end

