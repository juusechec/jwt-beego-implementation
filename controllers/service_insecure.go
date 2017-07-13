package controllers

import "github.com/juusechec/jwt-beego-implementation/myBeego"

type ServiceInsecureController struct {
	myBeego.Controller
}

// Puedes limpiar la autenticación reescribiendo el Prepare
func (c *ServiceInsecureController) Prepare() {}

func (c *ServiceInsecureController) GetService3() {
	c.Data["json"] = "{'message': 'Im In Service3'}"
	c.ServeJSON()
	return
}
