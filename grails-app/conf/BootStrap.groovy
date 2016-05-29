import com.ligontech.usermanagement.Customer
import com.ligontech.usermanagement.Role
import com.ligontech.usermanagement.User
import com.ligontech.usermanagement.UserRole

class BootStrap {

    def init = { servletContext ->
        initCustomer();
    }
    def initCustomer(){
        if(User.findByUsername('superman')){
           return;
        }
        def customer=new Customer(name:'ligontech',
                ltCode: 'LT',
                email:'info@ligontech.com',
                phoneNo: '452545532',
                website: 'http://www.ligontech.com',
                country:'Nepal'
        );
        customer.save(flush: true,failOnError: true);
        def superman = new Role(authority: 'ROLE_SUPERMAN').save(flush: true,failOnError: true);
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true,failOnError: true);
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true,failOnError: true);

        def testUser = new User(username: 'superman', password: 'superman',firstName: 'superman',lastName: 'superman',email: 'superman@superman.com',userCustomerCode: customer.ltCode)
        testUser.save(flush: true,failOnError: true);

    }
    def destroy = {
    }
}
