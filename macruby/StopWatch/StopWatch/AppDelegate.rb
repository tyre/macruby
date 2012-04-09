#
#  AppDelegate.rb
#  StopWatch
#
#  Created by Chris Maddox on 4/8/12.
#

class AppDelegate
  attr_accessor :window, :textField
  def applicationDidFinishLaunching(a_notification)
    # Insert code here to initialize your application
  end
  
  def startTimer(sender)
    unless @timer
      @time = 0.0
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                      target: self,
                                      selector: "timerHandler:",
                                      userInfo: nil,
                                      repeats: true)
    end
  end
  
  def stopTimer(sender)
    if @timer
      @timer.invalidate
      @timer = nil
    end
  end
  
  def timerHandler(userInfo)
    @time += 0.1
    string = sprintf("%.1f", @time)
    textField.setStringValue(string)
  end
end

