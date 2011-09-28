require 'flote/scheduler'

class StartCommand
	
	def initialize runner, view
		@runner = runner
		@view = view
	end
	
	def execute_from_shell params
		start params[1], params[2]
	end

	def start command
		unless command then @view.show_missing_command_argument_error "start", "shell_command"; return end
	  @view.show_start_message command
	  @runner.run_command = command
	  scheduler = Scheduler.new @runner, @view
	  scheduler.start
	end
	
	def accepts_shell_command? command
		command == 'start'
	end
	
	def continue_test_loop?
		true
	end
	
end