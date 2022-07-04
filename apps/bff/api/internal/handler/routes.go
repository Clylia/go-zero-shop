// Code generated by goctl. DO NOT EDIT.
package handler

import (
	"net/http"

	user "go-zero-shop/apps/bff/api/internal/handler/user"
	"go-zero-shop/apps/bff/api/internal/svc"

	"github.com/zeromicro/go-zero/rest"
)

func RegisterHandlers(server *rest.Server, serverCtx *svc.ServiceContext) {
	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodPost,
				Path:    "/login",
				Handler: user.LoginHandler(serverCtx),
			},
		},
		rest.WithPrefix("/v1/user"),
	)
}