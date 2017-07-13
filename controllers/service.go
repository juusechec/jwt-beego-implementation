package controllers

import (
	"github.com/juusechec/jwt-beego-implementation/myBeego"
)

type ServiceController struct {
	myBeego.Controller
}

func (c *ServiceController) GetService1() {
	c.Data["json"] = "{'message': 'Im In Service1'}"
	c.ServeJSON()
	return
}

func (c *ServiceController) GetService2() {
	c.Data["json"] = "{'message': 'Im In Service2'}"
	c.ServeJSON()
	return
}
