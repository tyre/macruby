#
#  AppDelegate.rb
#  SW
#
#  Created by Chris Maddox on 4/8/12.
#  Copyright 2012 Chris Maddox. All rights reserved.
#

class AppDelegate
  attr_accessor :window, :addNameField, :currentVictim, :roster, :table
  def applicationDidFinishLaunching(a_notification)
    @table.setDataSource(self.roster)
  end

  def roster
    @roster ||= TableViewDataSource.new
  end
  
  def random(sender)
    if @roster.any?
      victim = self.roster.random
      self.currentVictim.setStringValue(victim)
    else
      self.currentVictim.setStringValue("Add people to the roster first!")
    end
  end
  
  def addStudentToRoster(sender)
    self.roster.tableView(@table,
                          setObjectValue: addNameField.stringValue,
                          forTableColumn: 0,
                          row: roster.numberOfRowsInTableView(@table))
  puts self.roster.inspect
  self.table.reloadData
  end
end

class TableViewDataSource
  attr_accessor :data
  
  def initialize
    self.data = [Array.new]
  end

  def any?
    data[0].any?
  end
  
  def tableView(table_view, setObjectValue: value, forTableColumn: column, row: row)
    self.data[table_view.columnWithIdentifier(column)][row] = value
    self.data[0].uniq!
  end
  
  def tableView(table_view, objectValueForTableColumn: column, row: row)
    self.data[table_view.columnWithIdentifier(column)][row]
  end
  
  def numberOfRowsInTableView(view)
    self.data[0].size
  end
  
  def random
    column = self.data[0]
    r_row = rand(column.size)
    puts "ROW: #{r_row}"
    column[r_row]
  end
end