#
#  AppDelegate.rb
#  SW
#
#  Created by Chris Maddox on 4/8/12.
#  Copyright 2012 __MyCompanyName__. All rights reserved.
#

class AppDelegate
  attr_accessor :window, :addNameField, :statsWindow, :table, :comboBox, :currentVictim, :statsVictim, :roster, :classWindow
  def applicationDidFinishLaunching(a_notification)
    self.comboBox.setUsesDataSource = true
    self.comboBox.setDataSource = self.roster
    self.classWindow.setReleasedWhenClosed = false
    self.statsWindow.setReleasedWhenClosed = false
  end

  def roster
    @roster ||= []
  end
  
  def random(sender)
    if @roster.any?
      @currentVictim = @roster.shuffle.first
    else
      @currentVictim = "Add people to the roster first!"
    end
  end
  
  def showClassStats(sender)
    self.classWindow.makeKeyAndOrderFront
  end
  
  def showStudentStats(sender)
    self.statsVictim = self.roster[comboBox.indexOfSelectedItem]
    self.statsWindow.makeKeyAndOrderFront
  end
  
  def addStudentToRoster(sender)
    self.roster << addNameField.stringValue
  end
end
