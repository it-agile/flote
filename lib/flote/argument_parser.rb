require 'shellutils/shell_argument_exception'
require 'shellutils/shell_wrapper'
require 'flote/runner'
require 'flote/console_view'
require 'flote/help_command'
require 'flote/start_command'

class ArgumentParser
	
	def initialize shell, view
		runner = Runner.new shell, view
		@help_command = HelpCommand.new view
		@capture_single_run_command = CaptureSingleRunCommand.new shell, view, runner
		@start_command = StartCommand.new runner, view
		@commands = [@help_command, @capture_single_run_command, @start_command]
	end
	
	def parse params
		params[0] = params[0] ? params[0].downcase : 'help'
		command_name = params[0]
		command_executed = false
		@commands.each do |command|
			if command.accepts_shell_command?(command_name) 
				command.execute_from_shell params
				command_executed = true
			end
		end
		if not command_executed and command_name == "spec"
			# 'spec" is for testing purpose only: do nothing special
		elsif not command_executed
			raise ShellArgumentException.new command_name
		end
	end

end
