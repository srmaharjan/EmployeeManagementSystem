package com.ligontech.usermanagement

class Permission {

      User user
      String permission

      Date dateCreated
      Date lastUpdated

      static constraints = {
            permission unique: ['user', 'permission']
      }
      static Set<Permission> get(long userId) {
            find 'from Permission where user.id=:userId',
                  [userId: userId]
      }

      static Permission create(User user, String permission) {
            new Permission(user: user, permission: permission).save(failOnError: true)
      }


      static void removeAll(User user) {
            executeUpdate 'delete from Permission where user=:user',[user:user]
      }
}