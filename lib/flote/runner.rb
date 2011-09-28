require 'shellutils/progress'

class Runner

  attr_accessor :source_files, :run_command

	WORKING_DIR = '.'

  def initialize shell, view
    @shell = shell
		@view = view
  end

  def start
	  execute
  end

  def execute
		files = @shell.files_in_dir_tree WORKING_DIR, @source_files
		newest_dir_entry = @shell.newest_dir_entry WORKING_DIR, files
    change_time = @shell.modification_time newest_dir_entry
    if change_time == @previous_change_time then
	 	  Progress.next
      return
    end
    Progress.end
		@view.show_run_once_message newest_dir_entry, change_time
		execute_once
    @previous_change_time = change_time
  end

	def execute_once
		process = @shell.execute @run_command
	end
	
	def run_command= command
		@run_command = @shell.expand_run_command command
	end

end

