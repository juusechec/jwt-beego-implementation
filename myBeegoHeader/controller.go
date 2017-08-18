//./myBeego/controller.go

//Package myBeegoHeader Se crea un espacio de nombres llamado myBeego
package myBeegoHeader

//Se agrega la biblioteca de beego
import (
	"github.com/astaxie/beego"
	jwtbeego "github.com/juusechec/jwt-beego"
)

//Controller Se genera un tipo Controller que hereda de beego.Controller
type Controller struct {
	beego.Controller
}

//Prepare Se redefine lo que hace la función Prepare
//* es un apuntador al igual que en C
//& hace referencia a la dirección de memoria
//La iniciación de una variable o funcion con * se traduce en que almacena
//u := 10 //var z *int  //z = &u //fmt.Println(z)//0x1040e0f8
//var s *string //var r **string = &s //fmt.Println(r)//0x1040a120
func (c *Controller) Prepare() {
	//Lo que quieras hacer en todos los controladores
	tokenString := c.Ctx.Request.Header.Get("X-JWTtoken")
	et := jwtbeego.EasyToken{}
	valido, _ := et.ValidateToken(tokenString)
	if !valido {
		c.Ctx.Output.SetStatus(401)
		c.Data["json"] = "Permission Deny"
		c.ServeJSON()
	}
	return
}
