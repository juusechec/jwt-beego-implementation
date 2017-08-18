package controllers

import (
	"github.com/juusechec/jwt-beego-implementation/myBeego"
)

// ServiceController este controlador requiere JWT
type ServiceController struct {
	myBeego.Controller
}

// GetService1 ejemplo de respuesta JSON
func (c *ServiceController) GetService1() {
	c.Data["json"] = "{'message': 'Im In Service1'}"
	c.ServeJSON()
	return
}

// GetService2 ejemplo de respuesta JSON
func (c *ServiceController) GetService2() {
	c.Data["json"] = "{'message': 'Im In Service2'}"
	c.ServeJSON()
	return
}
