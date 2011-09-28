require 'shellutils/shell_wrapper'

class ConsoleView

	def show_help
		show <<-helptext
flote - Flow Tester, http://flote.github.com, Copyright by it-agile GmbH (http://www.it-agile.de)
flote is a continuous tester that works with every programming language that can be build and run from the shell.

helptext
		show_usage
	end
	
	def show_usage
		show <<-helptext
Usage: #{current_command_path} command [options]
Commands:
  help, -h, --help                                  Print this help text.
  help <command>                                    Print a detailed help text for the given command.
  start                                             Start the testing.
  capture-single-run <shell_command> <kata_file>    Capture a single run.

Report bugs to <codersdojo@it-agile.de>
helptext
	end
	
	def show_detailed_help command
		command = command.gsub('-', '_')
		begin
			eval "show_help_#{command}"
		rescue
			show_help_unknown command
		end
	end

	def show_help_start
		show <<-helptext
		
start <shell_command> <kata_file>  
    Start the continuous test runner, that runs <shell_command> whenever <kata_file>
    changes. The <kata_file> has to include the whole source code of the kata.
    Whenever the test runner is started, it creates a new session directory in the 
    directory .codersdojo where it logs the steps of the kata.
helptext
	end

	def show_help_capture_single_run
		show <<-helptext
		
capture-single-run <shell_command> <kata_file>  
    Execute <shell-command> once for <kata_file>.
    The <kata_file> has to include the whole source code of the kata.
    The run will be captured into the newest session dir in the .codersdojo dir.
    Usually this command is used after a session dir has been created with the init-session command.
helptext
	end
	
	def show_help_unknown command
		show <<-helptext
Command #{command} not known. Try '#{current_command_path} help' to list the supported commands.
helptext
	end
	
	def show_unknwon_command_message command
		show "Command #{command} not known.\n\n"
		show_usage
	end
	
	def show_missing_command_argument_error command, missing_argument
		show "Command <#{command}> recognized but argument <#{missing_argument}> was missing.\n"
		show_detailed_help command
	end
	
	def show_deprecated_command_argument_warning command, deprecated_argument
		show "Argument #{deprecated_argument} is deprecated for command #{command}. Please remove it."
	end
	
	def show_start_message command
	  show "Starting flote with command #{command}. Use Ctrl+C to stop flote."		
	end

	def show_run_once_message modified_file, modification_time
		time = modification_time.strftime("%X")
		date = modification_time.strftime("%x")
		show "\nFile #{modified_file} was modified at #{time} on #{date}. Run tests."
	end
	
	def show text
		puts @template_machine.render(text)
	end

	def read_user_input
		STDIN.gets
	end

	def current_command_path
		$0.gsub '/', '%/%'
	end
	
end
