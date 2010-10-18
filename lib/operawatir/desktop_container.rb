module OperaWatir
  module DesktopContainer
    
    ######################################################################
    # Method for accessing a button element
    #
    # @example
    #   $browser.quick_button(:name, "button_OK")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the button 
    #
    # @return [Object] button object if found, otherwise null
    #
    def quick_button(how, what)
      QuickButton.new(self, how, what)
    end

    ######################################################################
    # Method for accessing a checkbox element
    #
    # @example
    #   $browser.quick_checkbox(:name, "Enable_wand_checkbox")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the checkbox 
    #
    # @return [Object] checkbox object if found, otherwise null
    #
    def quick_checkbox(how, what)
      QuickCheckbox.new(self, how, what)
    end

    ######################################################################
    # Method for accessing a tab on a tabbed dialog
    #
    # @example
    #   $browser.quick_dialogtab(:name, "tab_prefs_forms")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the dialog tab 
    #
    # @return [Object] dialog tab object if found, otherwise null
    #
    def quick_dialogtab(how, what)
      QuickDialogTab.new(self, how, what)
    end

    ######################################################################
    # Method for accessing a combobox (i.e. dropdown) element
    #
    # @example
    #   $browser.quick_dropdown(:name, "Startup_mode_dropdown")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the drop down 
    #
    # @return [Object] drop down object if found, otherwise null
    #
    def quick_dropdown(how, what)
      QuickDropdown.new(self, how, what)
    end

    
    ######################################################################
    # Method for accessing an edit or multiedit element
    #
    # @example
    #   $browser.quick_editfield(:name, "Startpage_edit")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the edit field 
    #
    # @return [Object] edit field object if found, otherwise null
    #
    def quick_editfield(how, what)
      QuickEditField.new(self, how, what)
    end

    ######################################################################
    # Method for accessing a label element
    #
    # @example
    #   $browser.quick_label(:name, "label_for_Popups_dropdown")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the label 
    #
    # @return [Object] label object if found, otherwise null
    #
    def quick_label(how,what)
      QuickLabel.new(self,how,what)
    end

    ######################################################################
    # Method for accessing a radio button element
    #
    # @example
    #   $browser.quick_radiobutton(:name, "Accept_cookies_radio")
    #
    # @param [String] how   Method to find the element. Currently only :name is supported
    # @param [String] what  Search text to find the element with. Currently name of the radio button 
    #
    # @return [Object] radio button object if found, otherwise null
    #
    def quick_radiobutton(how, what)
      QuickRadioButton.new(self, how, what)
    end
  end
end
