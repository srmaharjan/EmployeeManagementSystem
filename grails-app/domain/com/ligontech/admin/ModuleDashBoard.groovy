package com.ligontech.admin

class ModuleDashBoard {
      String moduleController
      String moduleAction
      String displayName
      String image
      ModuleDashBoard parent;
      Boolean isParent=false;
      ModuleDashBoard subParent;
      Integer displayOrder
      String permission;
      Boolean isHidden=false;
//
//      def beforeInsert() {
//            permission=moduleController+":"+moduleAction;
//      }
//      def beforeUpdate(){
//            permission=moduleController+":"+moduleAction;
//      }

      static constraints = {
            moduleAction ( blank: false, nullable: false,unique: ['moduleController','isParent'])
            moduleController(blank: false, nullable: false)
            displayName(unique: true, blank: false, nullable: false)
            image(blank: true, nullable: true)
            parent(blank:true, nullable: true)
            subParent(blank:true, nullable: true)
            displayOrder(blank:true, nullable: true)
      }

      def String toString(){
            return displayName
      }

      boolean equals(o) {
            if (this.is(o)) return true
            if (!(o instanceof ModuleDashBoard)) return false

            ModuleDashBoard that = (ModuleDashBoard) o

            if (displayName != that.displayName) return false
            if (displayOrder != that.displayOrder) return false
            if (moduleAction != that.moduleAction) return false
            if (moduleController != that.moduleController) return false
            if (parent != that.parent) return false
            if (permission != that.permission) return false

            return true
      }

      int hashCode() {
            int result
            result = (moduleController != null ? moduleController.hashCode() : 0)
            result = 31 * result + (moduleAction != null ? moduleAction.hashCode() : 0)
            result = 31 * result + (displayName != null ? displayName.hashCode() : 0)
            result = 31 * result + (parent != null ? parent.hashCode() : 0)
            result = 31 * result + (displayOrder != null ? displayOrder.hashCode() : 0)
            result = 31 * result + (permission != null ? permission.hashCode() : 0)
            return result
      }
}
