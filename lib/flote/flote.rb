require 'shellutils/shell_wrapper'
require 'shellutils/shell_argument_exception'
require 'shellutils/argument_parser'
require 'flote/console_view'
require 'flote/runner'
require 'flote/start_command'

class Flote
	
	def initialize params
		@params = params
	end
	
	def run
		if called_from_spec? then return end
		shell = ShellWrapper.new
		view = ConsoleView.new
		runner = Runner.new shell, view

		begin
			arg_parser = ArgumentParser.new [StartCommand.new runner, view]
			command = arg_parser.parse @params
		rescue ShellArgumentException => e
			view.show_unknwon_command_message e.command
		end
  end

private

	def called_from_spec?
	  @params and @params[0] == "spec"
	end	
	
end