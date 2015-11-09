include ApplicationHelper
include TableBuilder

#
# Copyright 2012 The Board of Regents of the University of Wisconsin System.
# Contributors: Jason Shao, James McCurdy, Enhai Xie, Adam G.W. Halstead,
# Michael H. Whitney, Nathan DiPiazza, Trey K. Sato and Yury V. Bukhman
#
# This file is part of GCAT.
#
# GCAT is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GCAT is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with GCAT.  If not, see <http://www.gnu.org/licenses/>.
#
class AssaysController < ApplicationController

  def new
    @assay= Assay.new
  end

  def create 
    #Lazy mass assign from form params
    @assay = Assay.new(params[:assay])

    unless @assay.valid?
      render :action => :new
      return
    end
    
    # return the results from R into a new instance variable and display results via show template
    
    #execute R calculation and assign instance variable to display     
    original_stdout = $stdout
    # Try to override stdout to redirect the console output.
    
    @assay.generate_directory_and_move_files
    
    $stdout = File.new(@assay.generated_files_directory.join('console_out.txt'), 'w')
    $stdout.sync = true 
    
    begin
      #this method will create the upload directory and generated file direcotory and store theis paths in corresponding variables
      @assay.bind_arguments_to_r
      @result = @assay.r_calculation
      # parse the output text file into a hash in order to create a table in Assays#show
      @table = output_table(@result, !@result[:layout_file].nil?)
      puts @table
      remove_old_files(relative_path(@result[:zipfile]))
      flash.now[:notice] = "Your assay processed!\nPlease click on any of plate diagrams to save your results to a zip archive."  
      render :action => 'show'
    rescue GCATError=>e
      #remove files if calculation is not successful
      FileUtils.rm_rf @assay.uploaded_files_directory
      FileUtils.rm_rf @assay.generated_files_directory
      if not e.data.nil?
        flash.now[:error] = e.data[:error_message]
        @error_msg = e.data[:error_message]
        @console_msg = e.data[:console_msg]
      else
        @error_msg = e.message
      end
      render :action => 'inputfile_error_message'
    end
    $stdout.close
    $stdout = original_stdout
  end  
end
