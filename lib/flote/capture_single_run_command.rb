class CaptureSingleRunCommand

	COMMAND_NAME = 'capture-single-run'

	def initialize shell, view, runner
		@shell = shell
		@view = view
		@runner = runner
	end

	def execute_from_shell params
		unless params[1] then @view.show_missing_command_argument_error COMMAND_NAME, "shell_command"; return end
		capture_single_run params[1]
	end

	def capture_single_run run_command
		@runner.run_command = run_command
		@runner.execute_once
	end

	def accepts_shell_command? command
		command == COMMAND_NAME
	end
	
	def continue_test_loop?
		false
	end
		
end
