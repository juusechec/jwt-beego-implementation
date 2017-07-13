package main

import (
	"github.com/astaxie/beego"
	_ "github.com/juusechec/jwt-beego-implementation/routers"
)

func main() {
	beego.Run()
}
