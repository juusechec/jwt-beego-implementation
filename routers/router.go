package routers

import (
	"github.com/astaxie/beego"
	"github.com/juusechec/jwt-beego-implementation/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/user", &controllers.UserController{})
	beego.Router("/user/getToken", &controllers.UserController{}, "post:GetToken")
	beego.Router("/service1", &controllers.ServiceController{}, "get:GetService1")
	beego.Router("/service2", &controllers.ServiceController{}, "post:GetService2")
	beego.Router("/service3", &controllers.ServiceInsecureController{}, "get:GetService3")
}
