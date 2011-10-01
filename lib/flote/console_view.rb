class ConsoleView

	def show_help
		show <<-helptext
flote (Flow Tester), is a continuous testing tool.

helptext
		show_usage
	end

	def show_usage
		show <<-helptext
Usage: #{current_command_path} command [options] 
start <shell_command>    Watches all the files in the work dir (including subdirs) and runs the given shell command when a file was modified.

Report bugs to <codersdojo@it-agile.de>
helptext
	end
	
	def show_start command
	  show "Starting flow testing with flote with command #{command}. Use Ctrl+C to stop flote."		
	end
	
	def show_run_once_message modified_file, modification_time
		time = modification_time.strftime("%X")
		date = modification_time.strftime("%x")
		show "\nFile #{modified_file} was modified at #{time} on #{date}. Run tests."
	end
	
	def show_missing_command_argument_error command, missing_argument
		show "Command <#{command}> recognized but argument <#{missing_argument}> was missing.\n"
		show_detailed_help command
	end
	
	def show_unknwon_command_message command
		show "Command #{command} not known.\n\n"
		show_usage
	end
	
	def show text
		puts text
	end
	
	def current_command_path
		$0.gsub '/', '%/%'
	end
	
end