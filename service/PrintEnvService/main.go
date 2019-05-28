package main

import (
	"github.com/gin-gonic/gin"
	"os"
	"strings"
)

func main() {
	data := make(map[string]string)
	for _, x := range os.Environ() {
		// fmt.Println(x)
		s := strings.Split(x, "=")
		data[s[0]] = s[1]
	}
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, data)
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
