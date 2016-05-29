package com.ligontech

import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry
import org.springframework.beans.propertyeditors.CustomDateEditor

import java.text.SimpleDateFormat

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 11/2/13
 * Time: 10:59 AM
 * To change this template use File | Settings | File Templates.
 */
public class CustomDateEditorRegistrar implements PropertyEditorRegistrar {

    public void registerCustomEditors(PropertyEditorRegistry registry) {

        String dateFormat = 'dd MMMM yyyy'
        registry.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat(dateFormat), true))
    }
}
