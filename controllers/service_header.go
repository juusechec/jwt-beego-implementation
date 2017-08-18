package controllers

import (
	"encoding/json"
	"fmt"

	"github.com/juusechec/jwt-beego-implementation/myBeegoHeader"
)

// ServiceHeaderController permite autenticarse con HEADER
type ServiceHeaderController struct {
	myBeegoHeader.Controller
}

type responseStruct struct {
	Message string `json:"message"`
}

type reciveObj struct {
	Key string `json:"myKey"`
}

// GetService4 servicio que retorna una respuesta en JSON
func (c *ServiceHeaderController) GetService4() {
	var ob reciveObj
	fmt.Println(c.Ctx.Input.RequestBody)
	json.Unmarshal(c.Ctx.Input.RequestBody, &ob)
	fmt.Println(ob)

	if ob.Key == "" {
		myResponse := responseStruct{Message: "Im In Service4"}
		c.Data["json"] = &myResponse
	} else {
		c.Data["json"] = &ob
	}
	c.ServeJSON()
	return
}
