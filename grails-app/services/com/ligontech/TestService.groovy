package com.ligontech

import org.apache.shiro.authz.annotation.*

class TestService {
    @RequiresPermissions('printer:maintain:epsoncolor')
    boolean adminPrinter() { true }

    @RequiresPermissions(['action:jump', 'action:kick'])
    boolean requireJumpAndKick() { true }

    @RequiresPermissions(value=['action:jump', 'action:kick'], logical=Logical.OR)
    boolean requireJumpOrKick() { true }

    @RequiresPermissions('doesnt:exist')
    boolean impossiblePermissions() { true }

    @RequiresUser
    boolean requireUser() { true }

    @RequiresRoles(value=['ROLE_ADMIN', 'ROLE_USER'], logical=Logical.OR)
    boolean requireUserOrAdmin() { true }

    @RequiresRoles(value=['ROLE_ADMIN', 'ROLE_USER'])
    boolean requireUserAndAdmin() { true }

    @RequiresGuest
    boolean requireGuest() { true }

    @RequiresAuthentication
    boolean requireAuthentication() { true }
}
