package main

import (
	"github.com/gin-gonic/gin"
	"os"
)

func main() {
	serviceName, versionNum := "undefined", "undefined"

	if v, ok := os.LookupEnv("SERVICENAME"); ok {
		serviceName = v
	}

	if v, ok := os.LookupEnv("VERSIONNUM"); ok {
		versionNum = v
	}

	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"service": serviceName,
			"version": versionNum,
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
