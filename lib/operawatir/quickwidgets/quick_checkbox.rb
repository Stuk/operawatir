module OperaWatir
  class QuickCheckbox < QuickWidget
    
    # @private
    # Checks the type of the widget is correct
    def correct_type?
      @element.getType == WIDGET_ENUM_MAP[:checkbox]
    end

    ######################################################################
    # Checks if the checkbox is checked
    #
    # @return [Boolean] true if the checkbox is checked otherwise false
    #
    def checked?
      element.isSelected
    end
    
    ######################################################################
    # Clicks a radio button or checkbox and toggles it state
    #
    # @return [int] the new state of the radio button or checkbox,
    #               false for not checked, or true for checked
    #
    def toggle_with_click
      click()
      
      # Cheat since we don't have an even yet 
      sleep(0.1)

      element(true).isSelected
    end

    
    ######################################################################
    # Clicks the checkbox, and waits for the window with window name 
    # win_name to be shown
    #
    # @param [String] win_name name of the window that will be opened (Pass a blank string for any window)
    #
    # @return [int] Window ID of the window shown or 0 if no window is shown
    #
    def open_dialog_with_click(win_name)
      wait_start
      click()
      wait_for_window_shown(win_name)
    end
    
  end
end