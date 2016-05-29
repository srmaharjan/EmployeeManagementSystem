package com.ligontech

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 9/2/13
 * Time: 6:46 PM
 * To change this template use File | Settings | File Templates.
 */
public enum FieldType {
    LANGUAGE("Language"),
    DEMAND('Demand'),
    RELIGION('Religion'),
    FACILITY('Facility'),
    DEGREE('Degree'),
    RATING('Rating'),
    GENDER('Gender'),
    AGEGROUP('Age Group'),
    ZONE('Zone'),
    DISTRICT('District'),
    NATIONALITY('Nationality'),
    PASSPORT_STATUS('Passport Status'),
    MARTIAL_STATUS('Martial Status')

    final String value
    FieldType(String value) { this.value = value }

    String toString() { value }
    String getKey() { name() }
}
